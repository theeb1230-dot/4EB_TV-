import 'package:flutter_test/flutter_test.dart';
import 'package:local_data_flutter/local_data_flutter.dart';
import 'package:local_data_persistent/local_data_persistent.dart';
import 'package:presentation_contract/presentation_contract.dart';

void main() {
  test('load is idempotent and replace persists the current projection', () async {
    final backend = _MemoryBackend();
    final runtime = WatchProgressCompositionRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    final item = WatchProgressSurfaceItem(
      contentId: 'episode-1',
      position: const Duration(seconds: 12),
      duration: const Duration(minutes: 1),
      updatedAt: DateTime.utc(2026, 9, 25),
    );
    final collection = WatchProgressSurfaceCollection(<WatchProgressSurfaceItem>[item]);

    expect((await runtime.load()).history, isEmpty);
    await runtime.replace(collection);
    expect(runtime.current.history.single.contentId, 'episode-1');

    final reloaded = WatchProgressCompositionRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    expect((await reloaded.load()).history.single.position, const Duration(seconds: 12));
  });

  test('clear resets the in-memory projection and durable state', () async {
    final backend = _MemoryBackend();
    final runtime = WatchProgressCompositionRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    await runtime.clear();

    expect(runtime.current.history, isEmpty);
    final reloaded = WatchProgressCompositionRuntime(
      PersistentLocalKeyValueStore(backend),
    );
    expect((await reloaded.load()).history, isEmpty);
  });
}

final class _MemoryBackend implements PersistentStringBackend {
  final Map<String, String> values = <String, String>{};

  @override
  Future<void> delete(String key) async => values.remove(key);

  @override
  Future<Set<String>> keys() async => values.keys.toSet();

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;
}
