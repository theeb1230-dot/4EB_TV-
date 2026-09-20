import 'package:core_domain/core_domain.dart';
import 'package:local_data_memory/local_data_memory.dart';
import 'package:test/test.dart';

void main() {
  test('key/value scopes are isolated and clear is scoped', () async {
    final store = InMemoryLocalKeyValueStore();

    await store.write(LocalDataScope.settings, 'same', 'ar');
    await store.write(LocalDataScope.favorites, 'same', 'movie-1');

    expect(await store.read(LocalDataScope.settings, 'same'), 'ar');
    expect(await store.read(LocalDataScope.favorites, 'same'), 'movie-1');

    await store.clear(LocalDataScope.settings);
    expect(await store.read(LocalDataScope.settings, 'same'), isNull);
    expect(await store.read(LocalDataScope.favorites, 'same'), 'movie-1');
  });

  test('cache read evicts expired values deterministically', () async {
    final cache = InMemoryLocalCacheStore();
    final storedAt = DateTime.utc(2026, 9, 20, 5);
    final expiresAt = storedAt.add(const Duration(minutes: 5));

    await cache.write(
      'home',
      CachedValue(value: 'payload', storedAt: storedAt, expiresAt: expiresAt),
    );

    expect(
      (
        await cache.read(
          'home',
          now: expiresAt.subtract(const Duration(seconds: 1)),
        ),
      )?.value,
      'payload',
    );
    expect(await cache.read('home', now: expiresAt), isNull);
    expect(await cache.read('home', now: storedAt), isNull);
  });

  test('clearExpired removes only expired cache entries', () async {
    final cache = InMemoryLocalCacheStore();
    final now = DateTime.utc(2026, 9, 20, 5);

    await cache.write(
      'expired',
      CachedValue(value: 'old', storedAt: now, expiresAt: now),
    );
    await cache.write(
      'fresh',
      CachedValue(
        value: 'new',
        storedAt: now,
        expiresAt: now.add(const Duration(hours: 1)),
      ),
    );

    await cache.clearExpired(now: now);

    expect(await cache.read('expired', now: now), isNull);
    expect((await cache.read('fresh', now: now))?.value, 'new');
  });

  test('diagnostics remain local and expose immutable event history', () {
    final sink = InMemoryLocalDiagnosticsSink();
    final event = LocalDiagnosticEvent(
      code: 'cache.expired',
      occurredAt: DateTime.utc(2026, 9, 20, 5),
      attributes: const {'scope': 'cache'},
    );

    sink.record(event);

    expect(sink.events, [event]);
    expect(() => sink.events.add(event), throwsUnsupportedError);
  });
}
