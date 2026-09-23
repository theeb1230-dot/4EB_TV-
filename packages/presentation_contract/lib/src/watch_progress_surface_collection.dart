import 'watch_progress_surface.dart';

/// A deterministic projection for History and Continue Watching surfaces.
///
/// The collection keeps presentation policy in one place: completed items are
/// excluded from Continue Watching, while History remains a full recent list.
final class WatchProgressSurfaceCollection {
  WatchProgressSurfaceCollection(Iterable<WatchProgressSurfaceItem> items)
      : _items = List<WatchProgressSurfaceItem>.unmodifiable(items);

  final List<WatchProgressSurfaceItem> _items;

  List<WatchProgressSurfaceItem> get history => _sorted(_items);

  List<WatchProgressSurfaceItem> get continueWatching =>
      _sorted(_items.where((item) => !item.isCompleted));

  List<WatchProgressSurfaceItem> _sorted(
    Iterable<WatchProgressSurfaceItem> items,
  ) {
    final result = items.toList(growable: false);
    return List<WatchProgressSurfaceItem>.unmodifiable(
      result..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
    );
  }
}
