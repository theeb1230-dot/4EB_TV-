import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_player_flutter/native_player_flutter.dart';
import 'package:playback_orchestrator/playback_orchestrator.dart';

final class RuntimeStore implements LocalKeyValueStore {
  final values = <String, String>{};

  String _key(LocalDataScope scope, String key) => '$scope:$key';

  @override
  Future<void> clear(LocalDataScope scope) async {
    values.removeWhere((key, _) => key.startsWith('$scope:'));
  }

  @override
  Future<void> delete(LocalDataScope scope, String key) async {
    values.remove(_key(scope, key));
  }

  @override
  Future<String?> read(LocalDataScope scope, String key) async =>
      values[_key(scope, key)];

  @override
  Future<void> write(
    LocalDataScope scope,
    String key,
    String value,
  ) async {
    values[_key(scope, key)] = value;
  }
}

final class RuntimeSession implements NativeVideoSession {
  Duration currentPosition = Duration.zero;

  @override
  Future<void> dispose() async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> play() async {}

  @override
  Future<Duration> position() async => currentPosition;

  @override
  Future<void> seekTo(Duration position) async {
    currentPosition = position;
  }
}

PlaybackCandidate runtimeCandidate() => PlaybackCandidate(
      candidateId: 'runtime',
      protocol: PlaybackProtocol.hls,
      uri: Uri.parse('https://media.example/runtime.m3u8'),
      downloadable: false,
    );

void main() {
  test(
    'pause persists the same local position for resume and history',
    () async {
      final store = RuntimeStore();
      final resumeStore = ResumeCheckpointStore(store);
      final watchStore = WatchProgressStore(store);
      final session = RuntimeSession();
      final adapter = NativePlaybackAdapter(
        sessionFactory: (_) => session,
        resumeStore: resumeStore,
        watchProgressStore: watchStore,
      );

      await adapter.playCandidate(
        runtimeCandidate(),
        Duration.zero,
        contentId: 'episode-7',
      );
      session.currentPosition = const Duration(minutes: 3, seconds: 14);
      await adapter.pause();

      expect(
        (await resumeStore.read('episode-7'))?.position,
        const Duration(minutes: 3, seconds: 14),
      );
      expect(
        (await watchStore.read('episode-7'))?.position,
        const Duration(minutes: 3, seconds: 14),
      );
    },
  );

  test('watch history restores when resume checkpoint is absent', () async {
    final store = RuntimeStore();
    final watchStore = WatchProgressStore(store);
    await watchStore.write(
      const WatchProgress(
        contentId: 'episode-8',
        position: Duration(seconds: 42),
        duration: null,
        updatedAt: DateTime(2026, 1, 1),
      ),
    );
    final session = RuntimeSession();
    final adapter = NativePlaybackAdapter(
      sessionFactory: (_) => session,
      watchProgressStore: watchStore,
    );

    await adapter.playCandidate(
      runtimeCandidate(),
      Duration.zero,
      contentId: 'episode-8',
    );

    expect(session.currentPosition, const Duration(seconds: 42));
  });
}
