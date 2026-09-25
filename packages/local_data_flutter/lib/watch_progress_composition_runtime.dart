import 'package:core_domain/core_domain.dart';
import 'package:presentation_contract/presentation_contract.dart';

import 'watch_progress_local_runtime.dart';

/// Application-facing composition boundary for local watch progress.
///
/// The shell owns one instance for its lifetime. Loading is idempotent, and
/// all persistence remains behind the local-data boundary.
final class WatchProgressCompositionRuntime {
  WatchProgressCompositionRuntime(LocalKeyValueStore store)
      : _local = WatchProgressLocalRuntime(store);

  final WatchProgressLocalRuntime _local;
  WatchProgressSurfaceCollection _current =
      WatchProgressSurfaceCollection(<WatchProgressSurfaceItem>[]);
  bool _loaded = false;

  WatchProgressSurfaceCollection get current => _current;

  Future<WatchProgressSurfaceCollection> load() async {
    if (_loaded) return _current;
    _current = await _local.load();
    _loaded = true;
    return _current;
  }

  Future<void> replace(WatchProgressSurfaceCollection next) async {
    _current = next;
    _loaded = true;
    await _local.save(next);
  }

  Future<void> clear() async {
    _current = WatchProgressSurfaceCollection(<WatchProgressSurfaceItem>[]);
    _loaded = true;
    await _local.clear();
  }
}
