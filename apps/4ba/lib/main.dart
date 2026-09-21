import 'package:app_flow/app_flow.dart';
import 'package:core_domain/core_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_presentation/flutter_presentation.dart';
import 'package:native_player_flutter/native_player_flutter.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:presentation_contract/presentation_contract.dart';
import 'package:provider_sdk/provider_sdk.dart';

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
  const FourBaAppShell({super.key, this.registry});

  final ProviderRegistry? registry;

  @override
  State<FourBaAppShell> createState() => _FourBaAppShellState();
}

final class _FourBaAppShellState extends State<FourBaAppShell> {
  final NativePlaybackAdapter nativePlayback = NativePlaybackAdapter();
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
    required this.discovery,
    required this.refresh,
  });

  final AppFlowController flow;
  final NativePlaybackAdapter nativePlayback;
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
            refresh: refresh,
          ),
        AppFlowStage.details => _Details(flow: flow, refresh: refresh),
        AppFlowStage.episodes => _Episodes(
            flow: flow,
            nativePlayback: nativePlayback,
            refresh: refresh,
          ),
        AppFlowStage.resolving =>
          const Center(child: CircularProgressIndicator()),
        AppFlowStage.playing => const Center(child: Text('جاري التشغيل')),
        AppFlowStage.error =>
          const Center(child: Text('لا يتوفر مصدر تشغيل حاليًا')),
      },
    );
  }
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
    required this.refresh,
  });

  final AppFlowController flow;
  final DiscoveryCoordinator discovery;
  final VoidCallback refresh;

  @override
  State<_Search> createState() => _SearchState();
}

final class _SearchState extends State<_Search> {
  List<CanonicalContent> results = const [];
  bool loading = false;

  Future<void> search(String query) async {
    widget.flow.openSearch(query);
    setState(() => loading = true);
    final result = await widget.discovery.search(query);
    if (!mounted) return;
    setState(() {
      results = result.items;
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
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'ابحث عن فيلم أو مسلسل',
              border: OutlineInputBorder(),
            ),
            onSubmitted: search,
          ),
          if (loading) const LinearProgressIndicator(),
          if (!loading && widget.flow.state.query.isNotEmpty && results.isEmpty)
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
                    widget.flow.openDetails(content);
                    widget.refresh();
                  },
                );
              },
            ),
          ),
        ],
      );
}

final class _Details extends StatelessWidget {
  const _Details({required this.flow, required this.refresh});
  final AppFlowController flow;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            flow.state.content!.titles.first.value,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              flow.openEpisodes(flow.state.content!);
              refresh();
            },
            child: const Text('الحلقات'),
          ),
        ],
      );
}

final class _Episodes extends StatelessWidget {
  const _Episodes({
    required this.flow,
    required this.nativePlayback,
    required this.refresh,
  });
  final AppFlowController flow;
  final NativePlaybackAdapter nativePlayback;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) => ListTile(
        title: const Text('الحلقة 1'),
        onTap: () async {
          final episode = EpisodeRef(
            canonicalContentId: flow.state.content!.canonicalId,
            season: 1,
            episode: 1,
          );
          flow.selectEpisode(
            flow.state.content!,
            episode,
          );
          refresh();
          await flow.play(
            content: flow.state.content!,
            episode: episode,
            attempt: nativePlayback.attempt,
          );
          refresh();
        },
      );
}
