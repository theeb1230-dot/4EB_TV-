import 'package:core_domain/core_domain.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:resolver_engine/resolver_engine.dart';

typedef PlaybackAttempt = Future<AttemptResult> Function(
  PlaybackCandidate candidate,
  Duration resumePosition,
);

final class PlaybackOrchestrationResult {
  const PlaybackOrchestrationResult({
    required this.providerIds,
    required this.attemptedCandidateIds,
    required this.completed,
    this.selectedCandidateId,
    this.failureClass,
  });

  final List<String> providerIds;
  final List<String> attemptedCandidateIds;
  final bool completed;
  final String? selectedCandidateId;
  final ResolveFailureClass? failureClass;
}

final class PlaybackOrchestrator {
  const PlaybackOrchestrator(this.registry);

  final ProviderRegistry registry;

  Future<PlaybackOrchestrationResult> resolveAndPlay({
    required ResolveRequest request,
    required Capability capability,
    required PlaybackAttempt attempt,
    Duration resumePosition = Duration.zero,
    Map<String, CandidateHealth> health = const <String, CandidateHealth>{},
  }) async {
    final providers = registry.supporting(capability);
    final providerIds = <String>[];
    final candidates = <PlaybackCandidate>[];
    ResolveFailureClass? lastFailure;

    for (final provider in providers) {
      providerIds.add(provider.descriptor.providerId);
      try {
        final result = await provider.resolve(request);
        candidates.addAll(result.candidates);
        if (result.failures.isNotEmpty) {
          lastFailure = result.failures.last.failureClass;
        }
      } on Exception {
        lastFailure = ResolveFailureClass.network;
      }
    }

    if (candidates.isEmpty) {
      return PlaybackOrchestrationResult(
        providerIds: List.unmodifiable(providerIds),
        attemptedCandidateIds: const <String>[],
        completed: false,
        failureClass: lastFailure ?? ResolveFailureClass.unavailable,
      );
    }

    final outcome = await attemptRankedFallback(
      candidates: candidates,
      health: health,
      resumePosition: resumePosition,
      dataSaver: request.dataSaver,
      attempt: attempt,
    );

    return PlaybackOrchestrationResult(
      providerIds: List.unmodifiable(providerIds),
      attemptedCandidateIds: outcome.attemptedCandidateIds,
      completed: outcome.completed,
      selectedCandidateId: outcome.selectedCandidateId,
      failureClass: outcome.failureClass,
    );
  }
}
