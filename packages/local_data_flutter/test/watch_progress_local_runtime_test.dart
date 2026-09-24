import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  test('round-trips watch progress through local storage', () async {
    final backend = _MemoryBackend();
    final runtime = WatchProgressLocalRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    final updatedAt = DateTime.utc(2026, 9, 24, 19, 0);
    final collection = WatchProgressSurfaceCollection(
      <WatchProgressSurfaceItem>[
        WatchProgressSurfaceItem(
          contentId: 'movie-1',
          position: const Duration(minutes: 4),
          duration: const Duration(minutes: 10),
          updatedAt: updatedAt,
          seasonNumber: 1,
          episodeNumber: 2,
        ),
      ],
    );

    await runtime.save(collection);
    final restored = await runtime.load();

    expect(restored.history, hasLength(1));
    expect(restored.history.single.contentId, 'movie-1');
    expect(restored.history.single.position, const Duration(minutes: 4));
    expect(restored.history.single.duration, const Duration(minutes: 10));
    expect(restored.history.single.updatedAt, updatedAt);
    expect(restored.history.single.seasonNumber, 1);
    expect(restored.history.single.episodeNumber, 2);
  });

  test(
    'invalid persisted payload fails closed to an empty collection',
    () async {
      final backend = _MemoryBackend();
      final store = PersistentLocalKeyValueStore(backend);
      final runtime = WatchProgressLocalRuntime(store);
      await store.write(
        LocalDataScope.playbackProgress,
        'watch-progress-v1',
        '{"not":"a-list"}',
      );

      expect((await runtime.load()).history, isEmpty);
    },
  );

  test('clear removes the persisted projection', () async {
    final backend = _MemoryBackend();
    final runtime = WatchProgressLocalRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    await runtime.clear();

    expect((await runtime.load()).history, isEmpty);
  });
}

final class _MemoryBackend implements PersistentStringBackend {
  final Map<String, String> values = <String, String>{};

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<Set<String>> keys() async => values.keys.toSet();

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}
