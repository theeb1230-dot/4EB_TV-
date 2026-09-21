import 'package:app_flow/src/discovery_coordinator.dart';
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
    this.contentLocators = const <ProviderContentLocator>[],
  });

  final AppFlowStage stage;
  final String query;
  final CanonicalContent? content;
  final EpisodeRef? episode;
  final ResolveFailureClass? failureClass;
  final List<ProviderContentLocator> contentLocators;
}

final class AppFlowController {
  AppFlowController({required PlaybackOrchestrator playback})
      : _playback = playback;

  final PlaybackOrchestrator _playback;
  PlaybackAttempt? _lastAttempt;
  Duration _lastResumePosition = Duration.zero;
  AppFlowState _state = const AppFlowState();
  AppFlowState get state => _state;

  void openSearch([String query = '']) =>
      _state = AppFlowState(stage: AppFlowStage.search, query: query);

  void openDetails(CanonicalContent content,
          {List<ProviderContentLocator> locators =
              const <ProviderContentLocator>[]}) =>
      _state = AppFlowState(
          stage: AppFlowStage.details,
          content: content,
          contentLocators: List.unmodifiable(locators));

  void openEpisodes(CanonicalContent content) => _state = AppFlowState(
      stage: AppFlowStage.episodes,
      content: content,
      contentLocators: _state.contentLocators);

  void selectEpisode(CanonicalContent content, EpisodeRef episode) =>
      _state = AppFlowState(
          stage: AppFlowStage.episodes,
          content: content,
          episode: episode,
          contentLocators: _state.contentLocators);

  Future<PlaybackOrchestrationResult> play({
    required CanonicalContent content,
    EpisodeRef? episode,
    required PlaybackAttempt attempt,
    Duration resumePosition = Duration.zero,
    bool dataSaver = false,
  }) async {
    _lastAttempt = attempt;
    _lastResumePosition = resumePosition;
    _state = AppFlowState(
      stage: AppFlowStage.resolving,
      content: content,
      episode: episode,
      contentLocators: _state.contentLocators,
    );
    final result = await _playback.resolveAndPlay(
      request: ResolveRequest(
          content: content, episode: episode, dataSaver: dataSaver),
      capability: Capability.stream,
      attempt: attempt,
      resumePosition: resumePosition,
    );
    _state = AppFlowState(
      stage: result.completed ? AppFlowStage.playing : AppFlowStage.error,
      content: content,
      episode: episode,
      failureClass: result.failureClass,
      contentLocators: _state.contentLocators,
    );
    return result;
  }

  Future<PlaybackOrchestrationResult?> retry({
    Duration? resumePosition,
  }) async {
    final content = _state.content;
    final attempt = _lastAttempt;
    if (content == null || attempt == null) return null;
    return play(
      content: content,
      episode: _state.episode,
      attempt: attempt,
      resumePosition: resumePosition ?? _lastResumePosition,
    );
  }
}
