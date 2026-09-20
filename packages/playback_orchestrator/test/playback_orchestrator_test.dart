import 'package:core_domain/core_domain.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:resolver_engine/resolver_engine.dart';
import 'package:test/test.dart';

final class FakeProvider implements Provider {
  FakeProvider(this.id, this.result);

  final String id;
  final ResolveResult result;

  @override
  ProviderDescriptor get descriptor => ProviderDescriptor(
        providerId: id,
        version: '1',
        capabilities: const <Capability>{Capability.stream},
        configurationSchemaVersion: 1,
      );

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async => result;

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;
}

void main() {
  final content = CanonicalContent(
    canonicalId: 'movie-1',
    type: ContentType.movie,
    titles: const <LocalizedTitle>[
      LocalizedTitle(languageTag: 'ar', value: 'فيلم'),
    ],
  );

  test('resolves providers and falls back to next playable candidate',
      () async {
    final registry = ProviderRegistry()
      ..register(FakeProvider(
        'a',
        ResolveResult(candidates: <PlaybackCandidate>[
          PlaybackCandidate(
            candidateId: 'bad',
            protocol: PlaybackProtocol.hls,
            uri: Uri.parse('https://example.invalid/bad.m3u8'),
            downloadable: false,
          ),
        ]),
      ))
      ..register(FakeProvider(
        'b',
        ResolveResult(candidates: <PlaybackCandidate>[
          PlaybackCandidate(
            candidateId: 'good',
            protocol: PlaybackProtocol.mp4,
            uri: Uri.parse('https://example.invalid/good.mp4'),
            downloadable: false,
          ),
        ]),
      ));

    final result = await PlaybackOrchestrator(registry).resolveAndPlay(
      request: ResolveRequest(content: content),
      capability: Capability.stream,
      resumePosition: const Duration(seconds: 42),
      attempt: (candidate, resume) async {
        expect(resume, const Duration(seconds: 42));
        return candidate.candidateId == 'good'
            ? const AttemptResult.success()
            : const AttemptResult.retry(ResolveFailureClass.network);
      },
    );

    expect(result.completed, isTrue);
    expect(result.providerIds, <String>['a', 'b']);
    expect(result.attemptedCandidateIds, <String>['bad', 'good']);
    expect(result.selectedCandidateId, 'good');
  });

  test('fails closed when no provider returns a candidate', () async {
    final registry = ProviderRegistry()
      ..register(FakeProvider(
        'empty',
        const ResolveResult(
          candidates: <PlaybackCandidate>[],
          failures: <ResolveFailure>[
            ResolveFailure(failureClass: ResolveFailureClass.unavailable),
          ],
        ),
      ));

    final result = await PlaybackOrchestrator(registry).resolveAndPlay(
      request: ResolveRequest(content: content),
      capability: Capability.stream,
      attempt: (_, __) async => const AttemptResult.success(),
    );

    expect(result.completed, isFalse);
    expect(result.attemptedCandidateIds, isEmpty);
    expect(result.failureClass, ResolveFailureClass.unavailable);
  });
}
