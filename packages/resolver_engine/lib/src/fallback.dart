import 'package:core_domain/core_domain.dart';

import 'health.dart';
import 'ranking.dart';

enum AttemptDisposition { success, retryNext, stop }

final class AttemptResult {
  const AttemptResult._({
    required this.disposition,
    this.failureClass,
  });

  const AttemptResult.success()
      : this._(disposition: AttemptDisposition.success);

  const AttemptResult.retry(ResolveFailureClass failureClass)
      : this._(
          disposition: AttemptDisposition.retryNext,
          failureClass: failureClass,
        );

  const AttemptResult.stop(ResolveFailureClass failureClass)
      : this._(
          disposition: AttemptDisposition.stop,
          failureClass: failureClass,
        );

  final AttemptDisposition disposition;
  final ResolveFailureClass? failureClass;
}

typedef CandidateAttempt = Future<AttemptResult> Function(
  PlaybackCandidate candidate,
  Duration resumePosition,
);

final class FallbackOutcome {
  const FallbackOutcome({
    required this.attemptedCandidateIds,
    required this.completed,
    this.selectedCandidateId,
    this.failureClass,
  });

  final List<String> attemptedCandidateIds;
  final bool completed;
  final String? selectedCandidateId;
  final ResolveFailureClass? failureClass;
}

Future<FallbackOutcome> attemptRankedFallback({
  required Iterable<PlaybackCandidate> candidates,
  required Map<String, CandidateHealth> health,
  required Duration resumePosition,
  required CandidateAttempt attempt,
  bool dataSaver = false,
}) async {
  final ranked = rankCandidates(
    candidates: candidates,
    health: health,
    dataSaver: dataSaver,
  );
  final attempted = <String>[];

  for (final item in ranked) {
    final candidate = item.candidate;
    attempted.add(candidate.candidateId);
    final result = await attempt(candidate, resumePosition);

    switch (result.disposition) {
      case AttemptDisposition.success:
        return FallbackOutcome(
          attemptedCandidateIds: List.unmodifiable(attempted),
          completed: true,
          selectedCandidateId: candidate.candidateId,
        );
      case AttemptDisposition.retryNext:
        continue;
      case AttemptDisposition.stop:
        return FallbackOutcome(
          attemptedCandidateIds: List.unmodifiable(attempted),
          completed: false,
          failureClass: result.failureClass,
        );
    }
  }

  return FallbackOutcome(
    attemptedCandidateIds: List.unmodifiable(attempted),
    completed: false,
    failureClass: ResolveFailureClass.unavailable,
  );
}
