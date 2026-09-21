import 'package:app_flow/app_flow.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:native_player_flutter/native_player_flutter.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:presentation_contract/presentation_contract.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:video_player/video_player.dart';

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
  late final ProviderRegistry registry = widget.registry ?? ProviderRegistry();
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
            hasDiscoveryProviders: registry.discoveryProviders().isNotEmpty,
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
        AppFlowStage.error =>
          const Center(child: Text('لا يتوفر مصدر تشغيل حاليًا')),
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
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'لا يوجد مزود محتوى مفعّل حاليًا. البحث متوقف حتى يتم تفعيل مصدر مصرح به.',
              ),
            ),
          TextField(
            enabled: widget.hasDiscoveryProviders,
            autofocus: widget.hasDiscoveryProviders,
            decoration: const InputDecoration(
              hintText: 'ابحث عن فيلم أو مسلسل',
              border: OutlineInputBorder(),
            ),
            onSubmitted: search,
          ),
          if (loading) const LinearProgressIndicator(),
          if (widget.hasDiscoveryProviders &&
              !loading &&
              widget.flow.state.query.isNotEmpty &&
              results.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('لا توجد نتائج'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final content = results[index];
                return ListTile(
                  title: Text(content.titles.first.value),
                  onTap: () {
                    widget.flow.openDetails(
                      content,
                      locators: locators[content.canonicalId] ?? const [],
                    );
                    widget.refresh();
                  },
                );
              },
            ),
          ),
        ],
      );
}

final class _Details extends StatefulWidget {
  const _Details({
    required this.flow,
    required this.discovery,
    required this.refresh,
  });

  final AppFlowController flow;
  final DiscoveryCoordinator discovery;
  final VoidCallback refresh;

  @override
  State<_Details> createState() => _DetailsState();
}

final class _DetailsState extends State<_Details> {
  CanonicalContent? content;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final selected = widget.flow.state.content;
    if (selected == null) {
      if (mounted) setState(() => loading = false);
      return;
    }
    final detailed = await widget.discovery.details(
      selected.canonicalId,
      locators: widget.flow.state.contentLocators,
    );
    if (!mounted) return;
    setState(() {
      content = detailed ?? selected;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    final selected = content;
    if (selected == null) {
      return const Center(child: Text('تعذر تحميل التفاصيل'));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selected.titles.first.value,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (selected.year != null) Text('${selected.year}'),
        if (selected.genres.isNotEmpty) Text(selected.genres.join(' • ')),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () {
            widget.flow.openEpisodes(selected);
            widget.refresh();
          },
          child: const Text('الحلقات'),
        ),
      ],
    );
  }
}

final class _Episodes extends StatefulWidget {
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
  State<_Episodes> createState() => _EpisodesState();
}

final class _EpisodesState extends State<_Episodes> {
  List<EpisodeRef> episodes = const [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final content = widget.flow.state.content;
    if (content == null) {
      if (mounted) setState(() => loading = false);
      return;
    }
    final items = await widget.discovery.episodes(
      content,
      locators: widget.flow.state.contentLocators,
    );
    if (!mounted) return;
    setState(() {
      episodes = items;
      loading = false;
    });
  }

  Future<void> play(EpisodeRef episode) async {
    final content = widget.flow.state.content;
    if (content == null) return;
    widget.flow.selectEpisode(content, episode);
    widget.refresh();
    await widget.flow.play(
      content: content,
      episode: episode,
      attempt: widget.nativePlayback.attempt,
    );
    widget.refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());
    if (episodes.isEmpty) {
      return const Center(child: Text('لا توجد حلقات متاحة'));
    }
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final episode = episodes[index];
        final title = episode.title ?? 'الحلقة ${episode.episode}';
        return ListTile(
          title: Text(title),
          subtitle: Text('الموسم ${episode.season}'),
          onTap: () => play(episode),
        );
      },
    );
  }
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

final class _PlayerSurfaceState extends State<_PlayerSurface>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.nativePlayback.activeController?.addListener(_refreshPlayer);
    _restoreProgress();
  }

  Duration _lastSaved = Duration.zero;

  Future<void> _restoreProgress() async {
    final raw = await widget.localData.keyValueStore.read(
      LocalDataScope.playbackProgress,
      widget.progressKey,
    );
    final milliseconds = int.tryParse(raw ?? '');
    if (milliseconds != null && milliseconds > 0) {
      await widget.nativePlayback.seekTo(Duration(milliseconds: milliseconds));
    }
  }

  void _refreshPlayer() {
    final controller = widget.nativePlayback.activeController;
    if (controller != null) {
      final position = controller.value.position;
      if ((position - _lastSaved).abs() >= const Duration(seconds: 5)) {
        _lastSaved = position;
        widget.localData.keyValueStore.write(
          LocalDataScope.playbackProgress,
          widget.progressKey,
          position.inMilliseconds.toString(),
        );
      }
    }
    if (mounted) setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      widget.nativePlayback.pause();
    }
  }

  @override
  void dispose() {
    widget.nativePlayback.activeController?.removeListener(_refreshPlayer);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> seekBy(Duration delta) async {
    final controller = widget.nativePlayback.activeController;
    if (controller == null) return;
    final duration = controller.value.duration;
    var target = controller.value.position + delta;
    if (target < Duration.zero) target = Duration.zero;
    if (duration > Duration.zero && target > duration) target = duration;
    await widget.nativePlayback.seekTo(target);
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.nativePlayback.activeController;
    if (controller == null || !controller.value.isInitialized) {
      return const Center(child: Text('تعذر فتح جلسة التشغيل'));
    }
    final value = controller.value;
    if (value.hasError) {
      return Center(
        child: Text('خطأ في التشغيل: ${value.errorDescription ?? 'غير معروف'}'),
      );
    }
    return Column(
      children: [
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: value.aspectRatio == 0 ? 16 / 9 : value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
        ),
        if (value.isBuffering) const LinearProgressIndicator(),
        VideoProgressIndicator(controller, allowScrubbing: true),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              tooltip: 'رجوع 10 ثوانٍ',
              onPressed: () => seekBy(const Duration(seconds: -10)),
              icon: const Icon(Icons.replay_10),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              autofocus: true,
              onPressed: () async {
                if (controller.value.isPlaying) {
                  await widget.nativePlayback.pause();
                } else {
                  await widget.nativePlayback.resume();
                }
                if (mounted) setState(() {});
              },
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              label: Text(controller.value.isPlaying ? 'إيقاف مؤقت' : 'تشغيل'),
            ),
            const SizedBox(width: 12),
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
