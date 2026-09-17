import 'package:core_domain/core_domain.dart';
import 'package:resolver_engine/resolver_engine.dart';
import 'package:test/test.dart';

PlaybackCandidate candidate(String id) => PlaybackCandidate(
      candidateId: id,
      protocol: PlaybackProtocol.hls,
      uri: Uri.parse('https://example.invalid/$id.m3u8'),
      downloadable: false,
    );

void main() {
  test('retries next candidate and preserves resume position', () async {
    final seenPositions = <Duration>[];
    final outcome = await attemptRankedFallback(
      candidates: [candidate('a'), candidate('b')],
      health: const {},
      resumePosition: const Duration(seconds: 73),
      attempt: (item, position) async {
        seenPositions.add(position);
        if (item.candidateId == 'a') {
          return const AttemptResult.retry(ResolveFailureClass.network);
        }
        return const AttemptResult.success();
      },
    );

    expect(outcome.completed, isTrue);
    expect(outcome.selectedCandidateId, 'b');
    expect(outcome.attemptedCandidateIds, ['a', 'b']);
    expect(
      seenPositions,
      [const Duration(seconds: 73), const Duration(seconds: 73)],
    );
  });

  test('policy failure stops fallback immediately', () async {
    final outcome = await attemptRankedFallback(
      candidates: [candidate('a'), candidate('b')],
      health: const {},
      resumePosition: Duration.zero,
      attempt: (item, position) async =>
          const AttemptResult.stop(ResolveFailureClass.policy),
    );

    expect(outcome.completed, isFalse);
    expect(outcome.failureClass, ResolveFailureClass.policy);
    expect(outcome.attemptedCandidateIds, ['a']);
  });

  test('exhaustion returns unavailable', () async {
    final outcome = await attemptRankedFallback(
      candidates: [candidate('a')],
      health: const {},
      resumePosition: Duration.zero,
      attempt: (item, position) async =>
          const AttemptResult.retry(ResolveFailureClass.timeout),
    );

    expect(outcome.completed, isFalse);
    expect(outcome.failureClass, ResolveFailureClass.unavailable);
  });
}
