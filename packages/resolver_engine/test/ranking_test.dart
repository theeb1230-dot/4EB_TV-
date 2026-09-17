import 'package:core_domain/core_domain.dart';
import 'package:resolver_engine/resolver_engine.dart';
import 'package:test/test.dart';

PlaybackCandidate candidate(String id, int bitrate) => PlaybackCandidate(
      candidateId: id,
      protocol: PlaybackProtocol.hls,
      uri: Uri.parse('https://example.invalid/$id.m3u8'),
      downloadable: false,
      bitrate: bitrate,
    );

void main() {
  test('health success dominates candidate ranking', () {
    final now = DateTime.utc(2026);
    final good = summarizeHealth([
      HealthObservation(
        candidateId: 'good',
        success: true,
        latency: const Duration(milliseconds: 200),
        observedAt: now,
      ),
    ]);
    final bad = summarizeHealth([
      HealthObservation(
        candidateId: 'bad',
        success: false,
        latency: const Duration(milliseconds: 100),
        observedAt: now,
      ),
    ]);

    final ranked = rankCandidates(
      candidates: [candidate('bad', 8000000), candidate('good', 2000000)],
      health: {'good': good, 'bad': bad},
    );

    expect(ranked.first.candidate.candidateId, 'good');
  });

  test('data saver favors lower known bitrate when health is equal', () {
    final ranked = rankCandidates(
      candidates: [candidate('high', 8000000), candidate('low', 1000000)],
      health: const {},
      dataSaver: true,
    );

    expect(ranked.first.candidate.candidateId, 'low');
  });

  test('ties are deterministic', () {
    final ranked = rankCandidates(
      candidates: [candidate('b', 0), candidate('a', 0)],
      health: const {},
    );

    expect(ranked.map((item) => item.candidate.candidateId), ['a', 'b']);
  });
}
