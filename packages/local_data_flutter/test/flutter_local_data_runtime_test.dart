import 'package:core_domain/core_domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:local_data_persistent/local_data_persistent.dart';

final class MemoryStringBackend implements PersistentStringBackend {
  final Map<String, String> values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async {
    values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    values.remove(key);
  }

  @override
  Future<Set<String>> keys() async => values.keys.toSet();
}

void main() {
  test('composes scoped durable state and cache on one backend', () async {
    final backend = MemoryStringBackend();
    final runtime = FlutterLocalDataRuntime(backend: backend);
    final expiresAt = DateTime.utc(2030, 1, 1);

    await runtime.keyValueStore.write(
      LocalDataScope.settings,
      'language',
      'ar',
    );
    await runtime.cacheStore.write(
      'home',
      CachedValue(value: 'payload', expiresAt: expiresAt),
    );

    expect(
      await runtime.keyValueStore.read(LocalDataScope.settings, 'language'),
      'ar',
    );
    expect(
      (await runtime.cacheStore.read('home', now: DateTime.utc(2029)))?.value,
      'payload',
    );
    expect(backend.values.keys.where((key) => key.startsWith('kv/')).length, 1);
    expect(
      backend.values.keys.where((key) => key.startsWith('cache/')).length,
      1,
    );
  });

  test('recreation keeps persisted state available', () async {
    final backend = MemoryStringBackend();
    final first = FlutterLocalDataRuntime(backend: backend);
    await first.keyValueStore.write(LocalDataScope.history, 'item-1', 'seen');

    final recreated = FlutterLocalDataRuntime(backend: backend);

    expect(
      await recreated.keyValueStore.read(LocalDataScope.history, 'item-1'),
      'seen',
    );
  });
}
