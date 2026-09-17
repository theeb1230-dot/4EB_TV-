import 'package:core_domain/core_domain.dart';

import 'health.dart';

final class RankedCandidate {
  const RankedCandidate({
    required this.candidate,
    required this.score,
  });

  final PlaybackCandidate candidate;
  final double score;
}

List<RankedCandidate> rankCandidates({
  required Iterable<PlaybackCandidate> candidates,
  required Map<String, CandidateHealth> health,
  bool dataSaver = false,
}) {
  final ranked = candidates.map((candidate) {
    final evidence = health[candidate.candidateId];
    final success = evidence?.successRate ?? 0.5;
    final latencyMs = evidence?.averageLatency.inMilliseconds ?? 1000;
    final latencyScore = 1 / (1 + latencyMs / 1000);
    final bitrate = candidate.bitrate ?? 0;
    final qualityScore = dataSaver
        ? (bitrate == 0 ? 0.5 : 1 / (1 + bitrate / 1000000))
        : (bitrate == 0 ? 0.5 : (bitrate / 8000000).clamp(0, 1));

    final score = success * 0.65 + latencyScore * 0.20 + qualityScore * 0.15;
    return RankedCandidate(candidate: candidate, score: score);
  }).toList();

  ranked.sort((a, b) {
    final scoreOrder = b.score.compareTo(a.score);
    if (scoreOrder != 0) return scoreOrder;
    return a.candidate.candidateId.compareTo(b.candidate.candidateId);
  });

  return List.unmodifiable(ranked);
}
