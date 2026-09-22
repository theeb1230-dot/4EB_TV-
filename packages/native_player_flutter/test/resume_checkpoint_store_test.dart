import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_player_flutter/native_player_flutter.dart';

void main() {
  test('writes and restores playback progress', () async {
    final backend = _MemoryStore();
    final store = ResumeCheckpointStore(backend);
    final updatedAt = DateTime.utc(2026, 9, 23, 0, 10);

    await store.write(
      contentId: 'episode:42',
      position: const Duration(minutes: 12, seconds: 34),
      updatedAt: updatedAt,
    );

    final restored = await store.read('episode:42');
    expect(restored?.contentId, 'episode:42');
    expect(restored?.position, const Duration(minutes: 12, seconds: 34));
    expect(restored?.updatedAt, updatedAt);
  });

  test('zero position clears stale progress', () async {
    final backend = _MemoryStore();
    final store = ResumeCheckpointStore(backend);
    await store.write(
      contentId: 'episode:42',
      position: const Duration(minutes: 2),
      updatedAt: DateTime.utc(2026, 9, 23),
    );

    await store.write(
      contentId: 'episode:42',
      position: Duration.zero,
      updatedAt: DateTime.utc(2026, 9, 23, 0, 1),
    );

    expect(await store.read('episode:42'), isNull);
  });

  test('corrupt local progress fails closed and is removed', () async {
    final backend = _MemoryStore();
    await backend.write(LocalDataScope.playbackProgress, 'episode:42', '{bad');
    final store = ResumeCheckpointStore(backend);

    expect(await store.read('episode:42'), isNull);
    expect(
      await backend.read(LocalDataScope.playbackProgress, 'episode:42'),
      isNull,
    );
  });
}

final class _MemoryStore implements LocalKeyValueStore {
  final Map<String, String> _values = <String, String>{};

  String _key(LocalDataScope scope, String key) => '${scope.name}:$key';

  @override
  Future<String?> read(LocalDataScope scope, String key) async =>
      _values[_key(scope, key)];

  @override
  Future<void> write(LocalDataScope scope, String key, String value) async {
    _values[_key(scope, key)] = value;
  }

  @override
  Future<void> delete(LocalDataScope scope, String key) async {
    _values.remove(_key(scope, key));
  }

  @override
  Future<void> clear(LocalDataScope scope) async {
    _values.removeWhere((key, _) => key.startsWith('${scope.name}:'));
  }
}
