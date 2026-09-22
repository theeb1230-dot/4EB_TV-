import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_player_flutter/native_player_flutter.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart'
    show AttemptDisposition;

final class FakeSession implements NativeVideoSession {
  FakeSession({
    this.failInitialize = false,
    this.currentPosition = Duration.zero,
  });

  final bool failInitialize;
  Duration currentPosition;
  bool initialized = false;
  bool played = false;
  bool paused = false;
  bool disposed = false;
  Duration? seekPosition;

  @override
  Future<void> initialize() async {
    if (failInitialize) {
      throw Exception('decoder/network failure');
    }
    initialized = true;
  }

  @override
  Future<Duration> position() async => currentPosition;

  @override
  Future<void> seekTo(Duration position) async {
    seekPosition = position;
    currentPosition = position;
  }

  @override
  Future<void> play() async => played = true;

  @override
  Future<void> pause() async => paused = true;

  @override
  Future<void> dispose() async => disposed = true;
}

PlaybackCandidate candidate(String url) => PlaybackCandidate(
      candidateId: url,
      protocol: PlaybackProtocol.hls,
      uri: Uri.parse(url),
      downloadable: false,
    );

void main() {
  test(
    'initializes, restores resume position and starts native session',
    () async {
      final session = FakeSession();
      final adapter = NativePlaybackAdapter(sessionFactory: (_) => session);

      final result = await adapter.playCandidate(
        candidate('https://media.example/stream.m3u8'),
        const Duration(seconds: 37),
      );

      expect(result.disposition, AttemptDisposition.success);
      expect(session.initialized, isTrue);
      expect(session.seekPosition, const Duration(seconds: 37));
      expect(session.played, isTrue);
      expect(adapter.activeSession, same(session));
    },
  );

  test('pause and resume delegate to active native session', () async {
    final session = FakeSession();
    final adapter = NativePlaybackAdapter(sessionFactory: (_) => session);
    await adapter.playCandidate(
      candidate('https://media.example/stream.m3u8'),
      Duration.zero,
    );

    await adapter.pause();
    expect(session.paused, isTrue);
    await adapter.seekTo(const Duration(seconds: 15));
    expect(session.seekPosition, const Duration(seconds: 15));
    session.played = false;
    await adapter.resume();
    expect(session.played, isTrue);
  });

  test('activePosition exposes a resume checkpoint only while active',
      () async {
    final session = FakeSession();
    final adapter = NativePlaybackAdapter(sessionFactory: (_) => session);

    expect(await adapter.activePosition(), isNull);
    await adapter.playCandidate(
      candidate('https://media.example/stream.m3u8'),
      Duration.zero,
    );
    session.currentPosition = const Duration(minutes: 4, seconds: 21);

    expect(
      await adapter.activePosition(),
      const Duration(minutes: 4, seconds: 21),
    );
    await adapter.stop();
    expect(await adapter.activePosition(), isNull);
  });

  test('disposes failed session and returns retryable failure', () async {
    final session = FakeSession(failInitialize: true);
    final adapter = NativePlaybackAdapter(sessionFactory: (_) => session);

    final result = await adapter.playCandidate(
      candidate('https://media.example/video.mp4'),
      Duration.zero,
    );

    expect(result.disposition, AttemptDisposition.retryNext);
    expect(session.disposed, isTrue);
    expect(adapter.activeSession, isNull);
    expect(adapter.activeCandidate, isNull);
  });

  test('rejects non-http media before creating a platform session', () async {
    var created = false;
    final adapter = NativePlaybackAdapter(sessionFactory: (_) {
      created = true;
      return FakeSession();
    });

    final result = await adapter.playCandidate(
      candidate('file:///private/media.mp4'),
      Duration.zero,
    );

    expect(result.disposition, AttemptDisposition.retryNext);
    expect(created, isFalse);
  });

  test('starting a new candidate disposes the previous session', () async {
    final sessions = <FakeSession>[];
    final adapter = NativePlaybackAdapter(sessionFactory: (_) {
      final session = FakeSession();
      sessions.add(session);
      return session;
    });

    await adapter.playCandidate(
      candidate('https://media.example/one.m3u8'),
      Duration.zero,
    );
    await adapter.playCandidate(
      candidate('https://media.example/two.m3u8'),
      Duration.zero,
    );

    expect(sessions, hasLength(2));
    expect(sessions.first.disposed, isTrue);
    expect(sessions.last.played, isTrue);
  });

  test('switchCandidate preserves playback position across sources', () async {
    final sessions = <FakeSession>[];
    final adapter = NativePlaybackAdapter(sessionFactory: (_) {
      final session = FakeSession();
      sessions.add(session);
      return session;
    });

    await adapter.playCandidate(
      candidate('https://media.example/primary.m3u8'),
      Duration.zero,
    );
    sessions.first.currentPosition = const Duration(minutes: 12, seconds: 34);

    final result = await adapter.switchCandidate(
      candidate('https://media.example/fallback.m3u8'),
    );

    expect(result.disposition, AttemptDisposition.success);
    expect(sessions, hasLength(2));
    expect(sessions.first.disposed, isTrue);
    expect(
      sessions.last.seekPosition,
      const Duration(minutes: 12, seconds: 34),
    );
    expect(sessions.last.played, isTrue);
  });

  test(
    'retryActiveCandidate reopens same source at current position',
    () async {
      final sessions = <FakeSession>[];
      final uris = <Uri>[];
      final adapter = NativePlaybackAdapter(sessionFactory: (uri) {
        uris.add(uri);
        final session = FakeSession();
        sessions.add(session);
        return session;
      });
      final source = candidate('https://media.example/primary.m3u8');

      await adapter.playCandidate(source, Duration.zero);
      sessions.first.currentPosition = const Duration(minutes: 8, seconds: 9);

      final result = await adapter.retryActiveCandidate();

      expect(result.disposition, AttemptDisposition.success);
      expect(uris, [source.uri, source.uri]);
      expect(sessions.first.disposed, isTrue);
      expect(
        sessions.last.seekPosition,
        const Duration(minutes: 8, seconds: 9),
      );
      expect(sessions.last.played, isTrue);
    },
  );

  test(
    'retryActiveCandidate fails closed without an active source',
    () async {
      final adapter = NativePlaybackAdapter(
        sessionFactory: (_) => FakeSession(),
      );

      final result = await adapter.retryActiveCandidate();

      expect(result.disposition, AttemptDisposition.retryNext);
    },
  );
}
