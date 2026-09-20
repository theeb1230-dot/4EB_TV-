import 'package:core_domain/core_domain.dart';

final class InMemoryLocalKeyValueStore implements LocalKeyValueStore {
  final Map<LocalDataScope, Map<String, String>> _values = {};

  @override
  Future<String?> read(LocalDataScope scope, String key) async =>
      _values[scope]?[key];

  @override
  Future<void> write(LocalDataScope scope, String key, String value) async {
    (_values[scope] ??= <String, String>{})[key] = value;
  }

  @override
  Future<void> delete(LocalDataScope scope, String key) async {
    _values[scope]?.remove(key);
  }

  @override
  Future<void> clear(LocalDataScope scope) async {
    _values.remove(scope);
  }
}

final class InMemoryLocalCacheStore implements LocalCacheStore {
  final Map<String, CachedValue> _values = {};

  @override
  Future<CachedValue?> read(String key, {DateTime? now}) async {
    final value = _values[key];
    if (value == null) return null;

    final effectiveNow = now ?? DateTime.now().toUtc();
    if (value.isExpiredAt(effectiveNow)) {
      _values.remove(key);
      return null;
    }
    return value;
  }

  @override
  Future<void> write(String key, CachedValue value) async {
    _values[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _values.remove(key);
  }

  @override
  Future<void> clearExpired({required DateTime now}) async {
    _values.removeWhere((_, value) => value.isExpiredAt(now));
  }
}

final class InMemoryLocalDiagnosticsSink implements LocalDiagnosticsSink {
  final List<LocalDiagnosticEvent> _events = [];

  List<LocalDiagnosticEvent> get events =>
      List<LocalDiagnosticEvent>.unmodifiable(_events);

  @override
  void record(LocalDiagnosticEvent event) {
    _events.add(event);
  }

  void clear() => _events.clear();
}
