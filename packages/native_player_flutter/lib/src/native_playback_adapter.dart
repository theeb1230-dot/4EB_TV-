import 'package:core_domain/core_domain.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:video_player/video_player.dart';

abstract interface class NativeVideoSession {
  Future<void> initialize();
  Future<Duration> position();
  Future<void> seekTo(Duration position);
  Future<void> play();
  Future<void> pause();
  Future<void> dispose();
}

typedef NativeVideoSessionFactory = NativeVideoSession Function(Uri uri);

final class VideoPlayerNativeSession implements NativeVideoSession {
  VideoPlayerNativeSession(Uri uri)
      : _controller = VideoPlayerController.networkUrl(uri);

  final VideoPlayerController _controller;

  VideoPlayerController get controller => _controller;

  @override
  Future<void> initialize() => _controller.initialize();

  @override
  Future<Duration> position() async => _controller.value.position;

  @override
  Future<void> seekTo(Duration position) => _controller.seekTo(position);

  @override
  Future<void> play() => _controller.play();

  @override
  Future<void> pause() => _controller.pause();

  @override
  Future<void> dispose() => _controller.dispose();
}

final class NativePlaybackAdapter {
  NativePlaybackAdapter({
    NativeVideoSessionFactory? sessionFactory,
    ResumeCheckpointStore? resumeStore,
  })  : _sessionFactory =
            sessionFactory ?? ((uri) => VideoPlayerNativeSession(uri)),
        _resumeStore = resumeStore;

  final NativeVideoSessionFactory _sessionFactory;
  final ResumeCheckpointStore? _resumeStore;
  NativeVideoSession? _activeSession;
  PlaybackCandidate? _activeCandidate;
  String? _activeContentId;

  NativeVideoSession? get activeSession => _activeSession;
  PlaybackCandidate? get activeCandidate => _activeCandidate;

  VideoPlayerController? get activeController {
    final session = _activeSession;
    return session is VideoPlayerNativeSession ? session.controller : null;
  }

  Future<void> pause() async {
    await _persistActivePosition();
    await _activeSession?.pause();
  }

  Future<void> seekTo(Duration position) async =>
      _activeSession?.seekTo(position);

  Future<void> resume() async => _activeSession?.play();

  Future<Duration?> activePosition() async {
    final session = _activeSession;
    return session == null ? null : session.position();
  }

  PlaybackAttempt get attempt => playCandidate;

  Future<AttemptResult> retryActiveCandidate() async {
    final current = _activeSession;
    final candidate = _activeCandidate;
    if (current == null || candidate == null) {
      return const AttemptResult.retry(ResolveFailureClass.unavailable);
    }
    final resumePosition = await current.position();
    return playCandidate(
      candidate,
      resumePosition,
      contentId: _activeContentId,
    );
  }

  Future<AttemptResult> switchCandidate(PlaybackCandidate candidate) async {
    final current = _activeSession;
    final resumePosition =
        current == null ? Duration.zero : await current.position();
    return playCandidate(
      candidate,
      resumePosition,
      contentId: _activeContentId,
    );
  }

  Future<AttemptResult> playCandidate(
    PlaybackCandidate candidate,
    Duration resumePosition, {
    String? contentId,
  }) async {
    final scheme = candidate.uri.scheme.toLowerCase();
    if (scheme != 'https' && scheme != 'http') {
      return const AttemptResult.retry(ResolveFailureClass.unavailable);
    }

    final effectiveContentId = contentId ?? _activeContentId;
    var effectiveResumePosition = resumePosition;
    if (effectiveResumePosition <= Duration.zero &&
        effectiveContentId != null) {
      effectiveResumePosition =
          (await _resumeStore?.read(effectiveContentId))?.position ??
              Duration.zero;
    }

    await stop();
    final session = _sessionFactory(candidate.uri);
    _activeSession = session;
    _activeCandidate = candidate;
    _activeContentId = effectiveContentId;
    try {
      await session.initialize();
      if (effectiveResumePosition > Duration.zero) {
        await session.seekTo(effectiveResumePosition);
      }
      await session.play();
      return const AttemptResult.success();
    } on Exception {
      await session.dispose();
      if (identical(_activeSession, session)) {
        _activeSession = null;
        _activeCandidate = null;
        _activeContentId = null;
      }
      return const AttemptResult.retry(ResolveFailureClass.network);
    }
  }

  Future<void> stop() async {
    await _persistActivePosition();
    final session = _activeSession;
    _activeSession = null;
    _activeCandidate = null;
    _activeContentId = null;
    if (session != null) {
      await session.dispose();
    }
  }

  Future<void> _persistActivePosition() async {
    final store = _resumeStore;
    final contentId = _activeContentId;
    final session = _activeSession;
    if (store == null || contentId == null || session == null) return;
    await store.write(
      contentId: contentId,
      position: await session.position(),
      updatedAt: DateTime.now().toUtc(),
    );
  }
}
