import 'package:app_flow/app_flow.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:native_player_flutter/native_player_flutter.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:presentation_contract/presentation_contract.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:tvmaze_provider/tvmaze_provider.dart';
import 'package:video_player/video_player.dart';

import 'legal_about.dart';

void main() => runApp(const FourBaApp());

final class FourBaApp extends StatelessWidget {
  const FourBaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '4BA Cinematic Gold',
        theme: ThemeData.dark(useMaterial3: true),
        home: const FourBaAppShell(),
      );
}

final class FourBaAppShell extends StatefulWidget {
  const FourBaAppShell({super.key, this.registry, this.localData});

  final ProviderRegistry? registry;
  final FlutterLocalDataRuntime? localData;

  @override
  State<FourBaAppShell> createState() => _FourBaAppShellState();
}

final class _FourBaAppShellState extends State<FourBaAppShell> {
  final NativePlaybackAdapter nativePlayback = NativePlaybackAdapter();
  late final FlutterLocalDataRuntime localData =
      widget.localData ?? FlutterLocalDataRuntime();
  late final ProviderRegistry registry =
      widget.registry ?? (ProviderRegistry()..register(TvMazeProvider()));
  late final DiscoveryCoordinator discovery =
      DiscoveryCoordinator(registry: registry);
  late final AppFlowController flow = AppFlowController(
    playback: PlaybackOrchestrator(registry),
  );

  @override
  void dispose() {
    nativePlayback.stop();
    super.dispose();
  }

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final media = MediaQuery.of(context);
          return FourBaCinematicShell(
            contextModel: FourBaPresentationContext(
              logicalWidth: constraints.maxWidth,
              isTenFoot: constraints.maxWidth >= 1200,
              locale: FourBaLocale.ar,
              reduceMotion: media.disableAnimations,
              highContrast: media.highContrast,
              textScale: media.textScaler.scale(1),
            ),
            child: SafeArea(
              child: _FlowScreen(
                flow: flow,
                nativePlayback: nativePlayback,
                localData: localData,
                discovery: discovery,
                refresh: refresh,
              ),
            ),
          );
        },
      );
}

final class _FlowScreen extends StatelessWidget {
  const _FlowScreen({
    required this.flow,
    required this.nativePlayback,
    required this.localData,
    required this.discovery,
    required this.refresh,
  });

  final AppFlowController flow;
  final NativePlaybackAdapter nativePlayback;
  final FlutterLocalDataRuntime localData;
  final DiscoveryCoordinator discovery;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final state = flow.state;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: switch (state.stage) {
        AppFlowStage.home => _Home(flow: flow, refresh: refresh),
        AppFlowStage.search => _Search(
            flow: flow,
            discovery: discovery,
            hasDiscoveryProviders: discovery.hasDiscoveryProviders,
            refresh: refresh,
          ),
        AppFlowStage.details => _Details(
            flow: flow,
            discovery: discovery,
            refresh: refresh,
          ),
        AppFlowStage.episodes => _Episodes(
            flow: flow,
            nativePlayback: nativePlayback,
            discovery: discovery,
            refresh: refresh,
          ),
        AppFlowStage.resolving =>
          const Center(child: CircularProgressIndicator()),
        AppFlowStage.playing => _PlayerSurface(
            nativePlayback: nativePlayback,
            localData: localData,
            progressKey: _progressKey(state),
          ),
        AppFlowStage.error => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('لا يتوفر مصدر تشغيل حاليًا'),
                const SizedBox(height: 12),
                FilledButton.icon(
                  autofocus: true,
                  onPressed: () async {
                    final raw = await localData.keyValueStore.read(
                      LocalDataScope.playbackProgress,
                      _progressKey(state),
                    );
                    final milliseconds = int.tryParse(raw ?? '') ?? 0;
                    await flow.retry(
                      resumePosition: Duration(milliseconds: milliseconds),
                    );
                    refresh();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          ),
      },
    );
  }
}

String _progressKey(AppFlowState state) {
  final contentId = state.content?.canonicalId ?? 'unknown';
  final episode = state.episode;
  if (episode == null) return contentId;
  return '$contentId:s${episode.season}:e${episode.episode}';
}

final class _Home extends StatelessWidget {
  const _Home({required this.flow, required this.refresh});
  final AppFlowController flow;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('4BA', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              flow.openSearch();
              refresh();
            },
            child: const Text('البحث'),
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const LegalAboutSurface(),
              ),
            ),
            icon: const Icon(Icons.info_outline),
            label: const Text('حول وحقوق البيانات'),
          ),
        ],
      );
}

final class _Search extends StatefulWidget {
  const _Search({
    required this.flow,
    required this.discovery,
    required this.hasDiscoveryProviders,
    required this.refresh,
  });

  final AppFlowController flow;
  final DiscoveryCoordinator discovery;
  final bool hasDiscoveryProviders;
  final VoidCallback refresh;

  @override
  State<_Search> createState() => _SearchState();
}

final class _SearchState extends State<_Search> {
  List<CanonicalContent> results = const [];
  Map<String, List<ProviderContentLocator>> locators = const {};
  bool loading = false;

  Future<void> search(String query) async {
    widget.flow.openSearch(query);
    setState(() => loading = true);
    final result = await widget.discovery.search(query);
    if (!mounted) return;
    setState(() {
      results = result.items;
      locators = result.locators;
      loading = false;
    });
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('البحث', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          if (!widget.hasDiscoveryProviders)
            const Text('لا توجد مصادر اكتشاف متاحة حاليًا.'),
          TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: search,
            decoration: const InputDecoration(
              labelText: 'ابحث عن فيلم أو مسلسل',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          if (loading) const LinearProgressIndicator(),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                return ListTile(
                  title: Text(item.titles.first.value),
                  subtitle: item.year == null ? null : Text('${item.year}'),
                  onTap: () async {
                    final itemLocators = locators[item.canonicalId] ?? const [];
                    final detailed = await discovery.details(
                      item,
                      locators: itemLocators,
                    );
                    flow.openDetails(
                      detailed.content,
                      providerLocators: detailed.locators,
                    );
                    refresh();
                  },
                );
              },
            ),
          ),
        ],
      );
}

final class _Details extends StatelessWidget {
  const _Details({
    required this.flow,
    required this.discovery,
    required this.refresh,
  });

  final AppFlowController flow;
  final DiscoveryCoordinator discovery;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final content = flow.state.content;
    if (content == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.titles.first.value,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (content.year != null) Text('${content.year}'),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () async {
            final result = await discovery.episodes(
              content,
              locators: flow.state.providerLocators,
            );
            flow.openEpisodes(
              result.episodes,
              providerLocators: result.locators,
            );
            refresh();
          },
          child: const Text('الحلقات'),
        ),
      ],
    );
  }
}

final class _Episodes extends StatelessWidget {
  const _Episodes({
    required this.flow,
    required this.nativePlayback,
    required this.discovery,
    required this.refresh,
  });

  final AppFlowController flow;
  final NativePlaybackAdapter nativePlayback;
  final DiscoveryCoordinator discovery;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: flow.state.episodes.length,
        itemBuilder: (context, index) {
          final episode = flow.state.episodes[index];
          return ListTile(
            title: Text(
              episode.title ??
                  'الموسم ${episode.season} • الحلقة ${episode.episode}',
            ),
            onTap: () async {
              final result = await flow.play(
                episode,
                providerLocators: flow.state.providerLocators,
              );
              if (result != null) {
                await nativePlayback.play(result);
              }
              refresh();
            },
          );
        },
      );
}

final class _PlayerSurface extends StatefulWidget {
  const _PlayerSurface({
    required this.nativePlayback,
    required this.localData,
    required this.progressKey,
  });

  final NativePlaybackAdapter nativePlayback;
  final FlutterLocalDataRuntime localData;
  final String progressKey;

  @override
  State<_PlayerSurface> createState() => _PlayerSurfaceState();
}

final class _PlayerSurfaceState extends State<_PlayerSurface> {
  VideoPlayerController? get controller => widget.nativePlayback.controller;

  @override
  void initState() {
    super.initState();
    controller?.addListener(_onPlaybackChanged);
    _restoreProgress();
  }

  @override
  void dispose() {
    controller?.removeListener(_onPlaybackChanged);
    _persistProgress();
    super.dispose();
  }

  Future<void> _restoreProgress() async {
    final raw = await widget.localData.keyValueStore.read(
      LocalDataScope.playbackProgress,
      widget.progressKey,
    );
    final milliseconds = int.tryParse(raw ?? '') ?? 0;
    if (milliseconds > 0) {
      await widget.nativePlayback.seek(Duration(milliseconds: milliseconds));
    }
  }

  void _onPlaybackChanged() {
    _persistProgress();
    if (mounted) setState(() {});
  }

  Future<void> _persistProgress() async {
    final position = controller?.value.position;
    if (position == null) return;
    await widget.localData.keyValueStore.write(
      LocalDataScope.playbackProgress,
      widget.progressKey,
      position.inMilliseconds.toString(),
    );
  }

  Future<void> seekBy(Duration delta) async {
    final value = controller?.value;
    if (value == null) return;
    var target = value.position + delta;
    if (target < Duration.zero) target = Duration.zero;
    if (target > value.duration) target = value.duration;
    await widget.nativePlayback.seek(target);
  }

  @override
  Widget build(BuildContext context) {
    final player = controller;
    if (player == null) {
      return const Center(child: Text('المشغل غير جاهز'));
    }
    final value = player.value;
    if (value.hasError) {
      return Center(
        child: Text(value.errorDescription ?? 'تعذر تشغيل المصدر'),
      );
    }
    return Column(
      children: [
        Expanded(
          child: Center(
            child: value.isInitialized
                ? AspectRatio(
                    aspectRatio: value.aspectRatio,
                    child: VideoPlayer(player),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
        if (value.isBuffering) const LinearProgressIndicator(),
        VideoProgressIndicator(player, allowScrubbing: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              tooltip: 'رجوع 10 ثوانٍ',
              onPressed: () => seekBy(const Duration(seconds: -10)),
              icon: const Icon(Icons.replay_10),
            ),
            IconButton(
              tooltip: value.isPlaying ? 'إيقاف مؤقت' : 'تشغيل',
              autofocus: true,
              onPressed: () async {
                if (value.isPlaying) {
                  await widget.nativePlayback.pause();
                } else {
                  await widget.nativePlayback.resume();
                }
              },
              icon: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow),
            ),
            IconButton(
              tooltip: 'تقديم 10 ثوانٍ',
              onPressed: () => seekBy(const Duration(seconds: 10)),
              icon: const Icon(Icons.forward_10),
            ),
          ],
        ),
      ],
    );
  }
}
