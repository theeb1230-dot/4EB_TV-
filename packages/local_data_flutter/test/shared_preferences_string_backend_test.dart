import 'package:flutter_test/flutter_test.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('persists strings and enumerates keys', () async {
    final backend = SharedPreferencesStringBackend();

    await backend.write('kv/settings/language', 'ar');

    expect(await backend.read('kv/settings/language'), 'ar');
    expect(await backend.keys(), contains('kv/settings/language'));
  });

  test('delete removes durable value', () async {
    final backend = SharedPreferencesStringBackend();
    await backend.write('cache/item', 'payload');

    await backend.delete('cache/item');

    expect(await backend.read('cache/item'), isNull);
    expect(await backend.keys(), isNot(contains('cache/item')));
  });
}
