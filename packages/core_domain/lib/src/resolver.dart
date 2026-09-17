import 'content.dart';
import 'playback.dart';

final class ResolveRequest {
  const ResolveRequest({
    required this.content,
    this.episode,
    this.preferredAudioLanguage,
    this.preferredSubtitleLanguage,
    this.dataSaver = false,
  });

  final CanonicalContent content;
  final EpisodeRef? episode;
  final String? preferredAudioLanguage;
  final String? preferredSubtitleLanguage;
  final bool dataSaver;
}

enum ResolveFailureClass {
  unavailable,
  timeout,
  network,
  unsupported,
  policy,
  malformed,
}

final class ResolveFailure {
  const ResolveFailure({required this.failureClass, this.safeMessage});
  final ResolveFailureClass failureClass;
  final String? safeMessage;
}

final class ResolveResult {
  const ResolveResult({
    required this.candidates,
    this.failures = const <ResolveFailure>[],
  });

  final List<PlaybackCandidate> candidates;
  final List<ResolveFailure> failures;
}
