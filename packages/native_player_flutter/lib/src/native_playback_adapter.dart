import 'package:core_domain/core_domain.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';
import 'package:video_player/video_player.dart';

abstract interface class NativeVideoSession {
  Future<void> initialize();
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
  Future<void> seekTo(Duration position) => _controller.seekTo(position);

  @override
  Future<void> play() => _controller.play();

  @override
  Future<void> pause() => _controller.pause();

  @override
  Future<void> dispose() => _controller.dispose();
}

final class NativePlaybackAdapter {
  NativePlaybackAdapter({NativeVideoSessionFactory? sessionFactory})
      : _sessionFactory =
            sessionFactory ?? ((uri) => VideoPlayerNativeSession(uri));

  final NativeVideoSessionFactory _sessionFactory;
  NativeVideoSession? _activeSession;

  NativeVideoSession? get activeSession => _activeSession;

  VideoPlayerController? get activeController {
    final session = _activeSession;
    return session is VideoPlayerNativeSession ? session.controller : null;
  }

  Future<void> pause() async => _activeSession?.pause();

  Future<void> resume() async => _activeSession?.play();

  PlaybackAttempt get attempt => playCandidate;

  Future<AttemptResult> playCandidate(
    PlaybackCandidate candidate,
    Duration resumePosition,
  ) async {
    final scheme = candidate.uri.scheme.toLowerCase();
    if (scheme != 'https' && scheme != 'http') {
      return const AttemptResult.retry(ResolveFailureClass.unavailable);
    }

    await stop();
    final session = _sessionFactory(candidate.uri);
    _activeSession = session;
    try {
      await session.initialize();
      if (resumePosition > Duration.zero) {
        await session.seekTo(resumePosition);
      }
      await session.play();
      return const AttemptResult.success();
    } on Exception {
      await session.dispose();
      if (identical(_activeSession, session)) {
        _activeSession = null;
      }
      return const AttemptResult.retry(ResolveFailureClass.network);
    }
  }

  Future<void> stop() async {
    final session = _activeSession;
    _activeSession = null;
    if (session != null) {
      await session.dispose();
    }
  }
}
