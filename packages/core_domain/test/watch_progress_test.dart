import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

final class _MemoryStore implements LocalKeyValueStore {
  final Map<LocalDataScope, Map<String, String>> data = <LocalDataScope, Map<String, String>>{};

  Map<String, String> _bucket(LocalDataScope scope) =>
      data.putIfAbsent(scope, () => <String, String>{});

  @override
  Future<void> clear(LocalDataScope scope) async => _bucket(scope).clear();

  @override
  Future<void> delete(LocalDataScope scope, String key) async =>
      _bucket(scope).remove(key);

  @override
  Future<String?> read(LocalDataScope scope, String key) async =>
      _bucket(scope)[key];

  @override
  Future<void> write(LocalDataScope scope, String key, String value) async =>
      _bucket(scope)[key] = value;
}

void main() {
  test('watch progress round-trips with episode context', () async {
    final store = WatchProgressStore(_MemoryStore());
    final updatedAt = DateTime.utc(2026, 9, 23, 4, 0);

    await store.write(
      WatchProgress(
        contentId: 'series-1-episode-2',
        position: const Duration(minutes: 12, seconds: 4),
        duration: const Duration(minutes: 44),
        updatedAt: updatedAt,
        seasonNumber: 1,
        episodeNumber: 2,
      ),
    );

    final result = await store.read('series-1-episode-2');
    expect(result, isNotNull);
    expect(result!.position, const Duration(minutes: 12, seconds: 4));
    expect(result.duration, const Duration(minutes: 44));
    expect(result.seasonNumber, 1);
    expect(result.episodeNumber, 2);
    expect(result.isCompleted, isFalse);
  });

  test('zero position removes stale history', () async {
    final store = WatchProgressStore(_MemoryStore());
    await store.write(
      WatchProgress(
        contentId: 'movie-1',
        position: const Duration(minutes: 1),
        duration: const Duration(minutes: 2),
        updatedAt: DateTime.utc(2026, 9, 23),
      ),
    );

    await store.write(
      WatchProgress(
        contentId: 'movie-1',
        position: Duration.zero,
        duration: const Duration(minutes: 2),
        updatedAt: DateTime.utc(2026, 9, 23),
      ),
    );

    expect(await store.read('movie-1'), isNull);
  });

  test('corrupt history fails closed and is deleted', () async {
    final memory = _MemoryStore();
    await memory.write(LocalDataScope.history, 'bad', '{not-json');
    final store = WatchProgressStore(memory);

    expect(await store.read('bad'), isNull);
    expect(await memory.read(LocalDataScope.history, 'bad'), isNull);
  });
}
