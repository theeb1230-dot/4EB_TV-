import 'package:core_domain/core_domain.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';

enum AppFlowStage { home, search, details, episodes, resolving, playing, error }

final class AppFlowState {
  const AppFlowState({
    this.stage = AppFlowStage.home,
    this.query = '',
    this.content,
    this.episode,
    this.failureClass,
  });

  final AppFlowStage stage;
  final String query;
  final CanonicalContent? content;
  final EpisodeRef? episode;
  final ResolveFailureClass? failureClass;
}

final class AppFlowController {
  AppFlowController({required PlaybackOrchestrator playback})
      : _playback = playback;

  final PlaybackOrchestrator _playback;
  AppFlowState _state = const AppFlowState();

  AppFlowState get state => _state;

  void openSearch([String query = '']) =>
      _state = AppFlowState(stage: AppFlowStage.search, query: query);

  void openDetails(CanonicalContent content) => _state = AppFlowState(
        stage: AppFlowStage.details,
        content: content,
      );

  void openEpisodes(CanonicalContent content) => _state = AppFlowState(
        stage: AppFlowStage.episodes,
        content: content,
      );

  void selectEpisode(CanonicalContent content, EpisodeRef episode) =>
      _state = AppFlowState(
        stage: AppFlowStage.episodes,
        content: content,
        episode: episode,
      );

  Future<PlaybackOrchestrationResult> play({
    required CanonicalContent content,
    EpisodeRef? episode,
    required PlaybackAttempt attempt,
    Duration resumePosition = Duration.zero,
    bool dataSaver = false,
  }) async {
    _state = AppFlowState(
      stage: AppFlowStage.resolving,
      content: content,
      episode: episode,
    );
    final result = await _playback.resolveAndPlay(
      request: ResolveRequest(
        content: content,
        episode: episode,
        dataSaver: dataSaver,
      ),
      capability: Capability.stream,
      attempt: attempt,
      resumePosition: resumePosition,
    );
    _state = AppFlowState(
      stage: result.completed ? AppFlowStage.playing : AppFlowStage.error,
      content: content,
      episode: episode,
      failureClass: result.failureClass,
    );
    return result;
  }
}
