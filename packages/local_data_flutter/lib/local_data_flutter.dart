library local_data_flutter;

export 'watch_progress_composition_runtime.dart';
export 'watch_progress_local_runtime.dart';

import 'package:local_data_persistent/local_data_persistent.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPreferencesAsyncClient {
  Future<String?> getString(String key);
  Future<void> setString(String key, String value);
  Future<void> remove(String key);
  Future<Set<String>> getKeys();
}

final class PlatformSharedPreferencesAsyncClient
    implements SharedPreferencesAsyncClient {
  PlatformSharedPreferencesAsyncClient({SharedPreferencesAsync? preferences})
      : _preferences = preferences ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _preferences;

  @override
  Future<String?> getString(String key) => _preferences.getString(key);

  @override
  Future<void> setString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<void> remove(String key) => _preferences.remove(key);

  @override
  Future<Set<String>> getKeys() => _preferences.getKeys();
}

final class SharedPreferencesStringBackend implements PersistentStringBackend {
  SharedPreferencesStringBackend({SharedPreferencesAsyncClient? preferences})
      : _preferences = preferences ?? PlatformSharedPreferencesAsyncClient();

  final SharedPreferencesAsyncClient _preferences;

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

/// Runtime composition root for local-first state used by Flutter shells.
///
/// Both stores intentionally share one backend. Their namespaced keys keep
/// user state and cache entries isolated while allowing a platform shell to
/// construct the complete local-data boundary in one place.
final class FlutterLocalDataRuntime {
  FlutterLocalDataRuntime._(this.keyValueStore, this.cacheStore);

  factory FlutterLocalDataRuntime({PersistentStringBackend? backend}) {
    final durableBackend = backend ?? SharedPreferencesStringBackend();
    return FlutterLocalDataRuntime._(
      PersistentLocalKeyValueStore(durableBackend),
      PersistentLocalCacheStore(durableBackend),
    );
  }

  final PersistentLocalKeyValueStore keyValueStore;
  final PersistentLocalCacheStore cacheStore;
}
