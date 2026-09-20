library local_data_flutter;

import 'package:local_data_persistent/local_data_persistent.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Durable string backend composed only at the Flutter platform edge.
///
/// Core remains unaware of Flutter/plugins. Values are namespaced by the
/// higher-level persistent stores before reaching this adapter.
final class SharedPreferencesStringBackend implements PersistentStringBackend {
  SharedPreferencesStringBackend({SharedPreferencesAsync? preferences})
      : _preferences = preferences ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _preferences;

  @override
  Future<String?> read(String key) => _preferences.getString(key);

  @override
  Future<void> write(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<void> delete(String key) => _preferences.remove(key);

  @override
  Future<Set<String>> keys() => _preferences.getKeys();
}
