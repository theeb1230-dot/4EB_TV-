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
  const FourBaAppShell({super.key});

  @override
  State<FourBaAppShell> createState() => _FourBaAppShellState();
}

final class _FourBaAppShellState extends State<FourBaAppShell> {
  final NativePlaybackAdapter nativePlayback = NativePlaybackAdapter();
  late final AppFlowController flow = AppFlowController(
    playback: PlaybackOrchestrator(ProviderRegistry()),
  );

  @override
  void dispose() {
    nativePlayback.stop();
    super.dispose();
  }

  static const demo = CanonicalContent(
    canonicalId: 'local-demo',
    type: ContentType.series,
    titles: [LocalizedTitle(languageTag: 'ar', value: 'محتوى تجريبي محلي')],
  );

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
    required this.refresh,
  });

  final AppFlowController flow;
  final NativePlaybackAdapter nativePlayback;
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    final state = flow.state;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: switch (state.stage) {
        AppFlowStage.home => _Home(flow: flow, refresh: refresh),
        AppFlowStage.search => _Search(flow: flow, refresh: refresh),
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
          const SizedBox(height: 16),
          ListTile(
            title: const Text('محتوى تجريبي محلي'),
            subtitle: const Text('مسلسل'),
            onTap: () {
              flow.openDetails(_FourBaAppShellState.demo);
              refresh();
            },
          ),
        ],
      );
}

final class _Search extends StatelessWidget {
  const _Search({required this.flow, required this.refresh});
  final AppFlowController flow;
  final VoidCallback refresh;

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
            onSubmitted: (query) {
              flow.openSearch(query);
              refresh();
            },
          ),
          if (flow.state.query.isNotEmpty)
            ListTile(
              title: const Text('محتوى تجريبي محلي'),
              onTap: () {
                flow.openDetails(_FourBaAppShellState.demo);
                refresh();
              },
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
