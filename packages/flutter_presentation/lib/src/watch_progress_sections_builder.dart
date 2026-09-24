import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation_contract/presentation_contract.dart';

import 'watch_progress_sections.dart';

/// Bridges a local runtime projection into the presentation widget.
///
/// The notifier is intentionally a presentation-safe input. Storage, provider
/// SDKs, and stream URLs remain outside the widget tree.
class WatchProgressSectionsBuilder extends StatelessWidget {
  const WatchProgressSectionsBuilder({
    super.key,
    required this.collectionListenable,
    this.onItemTap,
    this.emptyHistoryLabel = 'No history yet',
    this.emptyContinueWatchingLabel = 'Nothing to continue',
  });

  final ValueListenable<WatchProgressSurfaceCollection> collectionListenable;
  final ValueChanged<WatchProgressSurfaceItem>? onItemTap;
  final String emptyHistoryLabel;
  final String emptyContinueWatchingLabel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<WatchProgressSurfaceCollection>(
      valueListenable: collectionListenable,
      builder: (context, collection, _) => WatchProgressSections(
        collection: collection,
        onItemTap: onItemTap,
        emptyHistoryLabel: emptyHistoryLabel,
        emptyContinueWatchingLabel: emptyContinueWatchingLabel,
      ),
    );
  }
}
