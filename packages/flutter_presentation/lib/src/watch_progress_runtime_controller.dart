import 'package:flutter/foundation.dart';
import 'package:presentation_contract/presentation_contract.dart';

/// Owns the local watch-progress projection consumed by the presentation layer.
///
/// This controller intentionally stores only presentation-safe metadata. It
/// does not know about providers, stream URLs, credentials, or persistence.
final class WatchProgressRuntimeController {
  WatchProgressRuntimeController({
    Iterable<WatchProgressSurfaceItem> initialItems =
        const <WatchProgressSurfaceItem>[],
  }) : _notifier = ValueNotifier<WatchProgressSurfaceCollection>(
          WatchProgressSurfaceCollection(initialItems),
        );

  final ValueNotifier<WatchProgressSurfaceCollection> _notifier;

  ValueListenable<WatchProgressSurfaceCollection> get listenable => _notifier;

  WatchProgressSurfaceCollection get value => _notifier.value;

  void replaceAll(Iterable<WatchProgressSurfaceItem> items) {
    _notifier.value = WatchProgressSurfaceCollection(items);
  }

  void upsert(WatchProgressSurfaceItem item) {
    final items = <WatchProgressSurfaceItem>[
      ...value.history
          .where((existing) => existing.contentId != item.contentId),
      item,
    ];
    replaceAll(items);
  }

  void remove(String contentId) {
    replaceAll(
      value.history.where((item) => item.contentId != contentId),
    );
  }

  void dispose() => _notifier.dispose();
}
