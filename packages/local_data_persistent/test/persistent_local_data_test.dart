import 'package:core_domain/core_domain.dart';
import 'package:local_data_persistent/local_data_persistent.dart';
import 'package:test/test.dart';

void main() {
  test('key value data survives adapter recreation and keeps scopes isolated',
      () async {
    final backend = MemoryPersistentStringBackend();
    await PersistentLocalKeyValueStore(backend)
        .write(LocalDataScope.favorites, 'same/key', 'movie-1');
    await PersistentLocalKeyValueStore(backend)
        .write(LocalDataScope.history, 'same/key', 'episode-9');

    final recreated = PersistentLocalKeyValueStore(backend);
    expect(
        await recreated.read(LocalDataScope.favorites, 'same/key'), 'movie-1');
    expect(
        await recreated.read(LocalDataScope.history, 'same/key'), 'episode-9');

    await recreated.clear(LocalDataScope.favorites);
    expect(await recreated.read(LocalDataScope.favorites, 'same/key'), isNull);
    expect(
        await recreated.read(LocalDataScope.history, 'same/key'), 'episode-9');
  });

  test('cache survives adapter recreation and evicts expired values', () async {
    final backend = MemoryPersistentStringBackend();
    final expiresAt = DateTime.utc(2026, 9, 20, 8);
    await PersistentLocalCacheStore(backend).write(
      'home/feed',
      CachedValue(
        value: 'payload',
        storedAt: expiresAt.subtract(const Duration(hours: 1)),
        expiresAt: expiresAt,
      ),
    );

    final recreated = PersistentLocalCacheStore(backend);
    expect(
      (await recreated.read(
        'home/feed',
        now: expiresAt.subtract(const Duration(seconds: 1)),
      ))
          ?.value,
      'payload',
    );
    expect(await recreated.read('home/feed', now: expiresAt), isNull);
  });

  test('corrupt persisted cache entries fail closed and are deleted', () async {
    final backend = MemoryPersistentStringBackend();
    await backend.write('cache/YmFk', 'not-json');

    final store = PersistentLocalCacheStore(backend);
    await store.clearExpired(now: DateTime.utc(2026, 9, 20));

    expect(await backend.read('cache/YmFk'), isNull);
  });
}
