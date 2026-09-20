enum LocalDataScope {
  settings,
  favorites,
  history,
  playbackProgress,
  cache,
  diagnostics,
}

abstract interface class LocalKeyValueStore {
  Future<String?> read(LocalDataScope scope, String key);

  Future<void> write(LocalDataScope scope, String key, String value);

  Future<void> delete(LocalDataScope scope, String key);

  Future<void> clear(LocalDataScope scope);
}

abstract interface class LocalCacheStore {
  Future<CachedValue?> read(String key, {DateTime? now});

  Future<void> write(String key, CachedValue value);

  Future<void> delete(String key);

  Future<void> clearExpired({required DateTime now});
}

final class CachedValue {
  const CachedValue({
    required this.value,
    required this.storedAt,
    this.expiresAt,
  });

  final String value;
  final DateTime storedAt;
  final DateTime? expiresAt;

  bool isExpiredAt(DateTime now) {
    final expiry = expiresAt;
    return expiry != null && !now.isBefore(expiry);
  }
}

abstract interface class LocalDiagnosticsSink {
  void record(LocalDiagnosticEvent event);
}

final class LocalDiagnosticEvent {
  const LocalDiagnosticEvent({
    required this.code,
    required this.occurredAt,
    this.attributes = const <String, String>{},
  });

  final String code;
  final DateTime occurredAt;
  final Map<String, String> attributes;
}
