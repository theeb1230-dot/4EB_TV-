import 'dart:convert';

import 'package:core_domain/core_domain.dart';
import 'package:local_data_codec/local_data_codec.dart';

import 'persistent_string_backend.dart';

final class PersistentLocalKeyValueStore implements LocalKeyValueStore {
  PersistentLocalKeyValueStore(this.backend);

  final PersistentStringBackend backend;

  String _key(LocalDataScope scope, String key) =>
      'kv/${scope.name}/${base64Url.encode(utf8.encode(key))}';

  @override
  Future<String?> read(LocalDataScope scope, String key) =>
      backend.read(_key(scope, key));

  @override
  Future<void> write(LocalDataScope scope, String key, String value) =>
      backend.write(_key(scope, key), value);

  @override
  Future<void> delete(LocalDataScope scope, String key) =>
      backend.delete(_key(scope, key));

  @override
  Future<void> clear(LocalDataScope scope) async {
    final prefix = 'kv/${scope.name}/';
    for (final key in await backend.keys()) {
      if (key.startsWith(prefix)) await backend.delete(key);
    }
  }
}

final class PersistentLocalCacheStore implements LocalCacheStore {
  PersistentLocalCacheStore(this.backend, {this.codec = const LocalDataCodec()});

  final PersistentStringBackend backend;
  final LocalDataCodec codec;

  String _key(String key) => 'cache/${base64Url.encode(utf8.encode(key))}';

  @override
  Future<CachedValue?> read(String key, {DateTime? now}) async {
    final storageKey = _key(key);
    final encoded = await backend.read(storageKey);
    if (encoded == null) return null;

    CachedValue value;
    try {
      value = codec.decodeCachedValue(encoded);
    } on FormatException {
      await backend.delete(storageKey);
      return null;
    }

    final effectiveNow = now ?? DateTime.now().toUtc();
    if (value.isExpiredAt(effectiveNow)) {
      await backend.delete(storageKey);
      return null;
    }
    return value;
  }

  @override
  Future<void> write(String key, CachedValue value) =>
      backend.write(_key(key), codec.encodeCachedValue(value));

  @override
  Future<void> delete(String key) => backend.delete(_key(key));

  @override
  Future<void> clearExpired({required DateTime now}) async {
    for (final key in await backend.keys()) {
      if (!key.startsWith('cache/')) continue;
      final encoded = await backend.read(key);
      if (encoded == null) continue;
      try {
        if (codec.decodeCachedValue(encoded).isExpiredAt(now)) {
          await backend.delete(key);
        }
      } on FormatException {
        await backend.delete(key);
      }
    }
  }
}
