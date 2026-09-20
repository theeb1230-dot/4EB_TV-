import 'package:core_domain/core_domain.dart';

import 'dedup.dart';

/// One provider-neutral search batch. Provider identity is intentionally kept
/// out of the returned content model so presentation never needs provider
/// brands or adapter objects.
final class MetadataSearchBatch {
  const MetadataSearchBatch({required this.items});

  final List<CanonicalContent> items;
}

/// Aggregates independently discovered metadata into one canonical result set.
///
/// This layer owns metadata deduplication only. It never resolves streams and
/// therefore preserves the Metadata != Streams architecture boundary.
final class MetadataSearchAggregator {
  const MetadataSearchAggregator();

  List<CanonicalContent> aggregate(Iterable<MetadataSearchBatch> batches) {
    final canonical = <CanonicalContent>[];

    for (final batch in batches) {
      for (final incoming in batch.items) {
        final match = matchCanonical(incoming, canonical);
        if (match == null) {
          canonical.add(incoming);
          continue;
        }

        final index = canonical.indexWhere(
          (item) => item.canonicalId == match.canonicalId,
        );
        if (index < 0) {
          canonical.add(incoming);
          continue;
        }

        canonical[index] = _merge(canonical[index], incoming);
      }
    }

    return List.unmodifiable(canonical);
  }

  CanonicalContent _merge(CanonicalContent current, CanonicalContent incoming) {
    final titles = <LocalizedText>[...current.titles];
    final titleKeys = titles.map((item) => '${item.locale}:${item.value}').toSet();
    for (final title in incoming.titles) {
      if (titleKeys.add('${title.locale}:${title.value}')) titles.add(title);
    }

    final externalIds = <ExternalId>[...current.externalIds];
    final idKeys = externalIds.map((item) => '${item.namespace}:${item.value}').toSet();
    for (final id in incoming.externalIds) {
      if (idKeys.add('${id.namespace}:${id.value}')) externalIds.add(id);
    }

    return CanonicalContent(
      canonicalId: current.canonicalId,
      type: current.type,
      titles: titles,
      year: current.year ?? incoming.year,
      externalIds: externalIds,
    );
  }
}
