import 'package:flutter/material.dart';
import 'package:presentation_contract/presentation_contract.dart';

/// Renders the local watch-progress projections without coupling the UI to
/// storage, provider SDKs, or stream URLs.
class WatchProgressSections extends StatelessWidget {
  const WatchProgressSections({
    super.key,
    required this.collection,
    this.onItemTap,
    this.emptyHistoryLabel = 'No history yet',
    this.emptyContinueWatchingLabel = 'Nothing to continue',
  });

  final WatchProgressSurfaceCollection collection;
  final ValueChanged<WatchProgressSurfaceItem>? onItemTap;
  final String emptyHistoryLabel;
  final String emptyContinueWatchingLabel;

  @override
  Widget build(BuildContext context) {
    final continueWatching = collection.continueWatching;
    final history = collection.history;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Section(
          sectionKey: 'continue-watching',
          title: 'Continue Watching',
          emptyLabel: emptyContinueWatchingLabel,
          items: continueWatching,
          onItemTap: onItemTap,
        ),
        const SizedBox(height: 24),
        _Section(
          sectionKey: 'history',
          title: 'History',
          emptyLabel: emptyHistoryLabel,
          items: history,
          onItemTap: onItemTap,
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.sectionKey,
    required this.title,
    required this.emptyLabel,
    required this.items,
    required this.onItemTap,
  });

  final String sectionKey;
  final String title;
  final String emptyLabel;
  final List<WatchProgressSurfaceItem> items;
  final ValueChanged<WatchProgressSurfaceItem>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey('watch-progress-section-$sectionKey'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        if (items.isEmpty)
          Text(emptyLabel)
        else
          ...items.map(
            (item) => Card(
              child: ListTile(
                key: ValueKey(
                  'watch-progress-item-$sectionKey-${item.contentId}',
                ),
                title: Text(item.contentId),
                subtitle: Text(_subtitle(item)),
                trailing: item.progressFraction == null
                    ? null
                    : SizedBox(
                        width: 72,
                        child: LinearProgressIndicator(
                          value: item.progressFraction,
                        ),
                      ),
                onTap: onItemTap == null ? null : () => onItemTap!(item),
              ),
            ),
          ),
      ],
    );
  }

  String _subtitle(WatchProgressSurfaceItem item) {
    final episode = item.seasonNumber == null || item.episodeNumber == null
        ? ''
        : 'S${item.seasonNumber} E${item.episodeNumber}';
    final progress = item.progressFraction == null
        ? ''
        : '${(item.progressFraction! * 100).round()}%';
    return [episode, progress].where((part) => part.isNotEmpty).join(' • ');
  }
}
