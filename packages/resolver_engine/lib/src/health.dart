final class HealthObservation {
  const HealthObservation({
    required this.candidateId,
    required this.success,
    required this.latency,
    required this.observedAt,
    this.bitrate,
  });

  final String candidateId;
  final bool success;
  final Duration latency;
  final DateTime observedAt;
  final int? bitrate;
}

final class CandidateHealth {
  const CandidateHealth({
    required this.successRate,
    required this.averageLatency,
    required this.sampleCount,
  });

  final double successRate;
  final Duration averageLatency;
  final int sampleCount;
}

CandidateHealth summarizeHealth(Iterable<HealthObservation> observations) {
  final items = observations.toList(growable: false);
  if (items.isEmpty) {
    return const CandidateHealth(
      successRate: 0,
      averageLatency: Duration.zero,
      sampleCount: 0,
    );
  }

  final successes = items.where((item) => item.success).length;
  final totalMicros = items.fold<int>(
    0,
    (sum, item) => sum + item.latency.inMicroseconds,
  );

  return CandidateHealth(
    successRate: successes / items.length,
    averageLatency: Duration(
      microseconds: totalMicros ~/ items.length,
    ),
    sampleCount: items.length,
  );
}
