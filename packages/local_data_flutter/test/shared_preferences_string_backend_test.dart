import 'package:flutter_test/flutter_test.dart';
import 'package:local_data_flutter/local_data_flutter.dart';

final class FakePreferencesClient implements SharedPreferencesAsyncClient {
  final Map<String, String> values = <String, String>{};

  @override
  Future<String?> getString(String key) async => values[key];

  @override
  Future<void> setString(String key, String value) async {
    values[key] = value;
  }

  @override
  Future<void> remove(String key) async {
    values.remove(key);
  }

  @override
  Future<Set<String>> getKeys() async => values.keys.toSet();
}

void main() {
  test('persists strings and enumerates keys', () async {
    final client = FakePreferencesClient();
    final backend = SharedPreferencesStringBackend(preferences: client);

    await backend.write('kv/settings/language', 'ar');

    expect(await backend.read('kv/settings/language'), 'ar');
    expect(await backend.keys(), contains('kv/settings/language'));
  });

  test('delete removes durable value', () async {
    final client = FakePreferencesClient();
    final backend = SharedPreferencesStringBackend(preferences: client);
    await backend.write('cache/item', 'payload');

    await backend.delete('cache/item');

    expect(await backend.read('cache/item'), isNull);
    expect(await backend.keys(), isNot(contains('cache/item')));
  });
}
