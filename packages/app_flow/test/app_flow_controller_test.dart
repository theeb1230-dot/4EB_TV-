import 'package:app_flow/app_flow.dart';
import 'package:core_domain/core_domain.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:test/test.dart';

final content = CanonicalContent(
  canonicalId: 'demo',
  type: ContentType.series,
  titles: const [LocalizedTitle(languageTag: 'ar', value: 'تجريبي')],
);

final class DemoProvider implements Provider {
  @override
  ProviderDescriptor get descriptor => const ProviderDescriptor(
        providerId: 'demo',
        version: '1',
        capabilities: {Capability.stream},
        configurationSchemaVersion: 1,
      );

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async => ResolveResult(
        candidates: [
          PlaybackCandidate(
            candidateId: 'stream-1',
            protocol: PlaybackProtocol.hls,
            uri: Uri.parse('https://media.example/demo.m3u8'),
            downloadable: false,
          ),
        ],
      );
}

void main() {
  test('moves through details, episodes, resolve and playing', () async {
    final registry = ProviderRegistry()..register(DemoProvider());
    final flow = AppFlowController(playback: PlaybackOrchestrator(registry));
    final episode = EpisodeRef(
      canonicalContentId: content.canonicalId,
      season: 1,
      episode: 1,
    );

    flow.openDetails(content);
    expect(flow.state.stage, AppFlowStage.details);
    flow.selectEpisode(content, episode);
    expect(flow.state.stage, AppFlowStage.episodes);

    final result = await flow.play(
      content: content,
      episode: episode,
      attempt: (_, __) async => const AttemptResult.success(),
    );

    expect(result.completed, isTrue);
    expect(flow.state.stage, AppFlowStage.playing);
  });

  test('preserves provider-local locators through the playback journey', () async {
    final registry = ProviderRegistry()..register(DemoProvider());
    final flow = AppFlowController(playback: PlaybackOrchestrator(registry));
    const locator = ProviderContentLocator(
      providerId: 'demo',
      providerContentId: 'provider-series-42',
    );
    final episode = EpisodeRef(
      canonicalContentId: content.canonicalId,
      season: 1,
      episode: 2,
    );

    flow.openDetails(content, locators: const [locator]);
    expect(flow.state.contentLocators, const [locator]);

    flow.openEpisodes(content);
    expect(flow.state.contentLocators, const [locator]);

    flow.selectEpisode(content, episode);
    expect(flow.state.contentLocators, const [locator]);

    await flow.play(
      content: content,
      episode: episode,
      attempt: (_, __) async => const AttemptResult.success(),
    );
    expect(flow.state.stage, AppFlowStage.playing);
    expect(flow.state.contentLocators, const [locator]);
  });
}
