import 'package:core_domain/core_domain.dart';

final class MetadataMatch {
  const MetadataMatch({
    required this.canonicalId,
    required this.confidence,
    required this.reason,
  });

  final String canonicalId;
  final double confidence;
  final String reason;
}

String normalizeTitle(String value) {
  final lower = value.toLowerCase().trim();
  return lower
      .replaceAll(RegExp(r'[^\p{L}\p{N}]+', unicode: true), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

MetadataMatch? matchCanonical(
  CanonicalContent incoming,
  Iterable<CanonicalContent> existing,
) {
  final incomingIds = incoming.externalIds
      .map((id) => id.namespace + ':' + id.value)
      .toSet();

  for (final candidate in existing) {
    final candidateIds = candidate.externalIds
        .map((id) => id.namespace + ':' + id.value)
        .toSet();
    if (incomingIds.intersection(candidateIds).isNotEmpty) {
      return MetadataMatch(
        canonicalId: candidate.canonicalId,
        confidence: 1,
        reason: 'external-id',
      );
    }
  }

  final incomingTitles = incoming.titles
      .map((title) => normalizeTitle(title.value))
      .where((title) => title.isNotEmpty)
      .toSet();

  MetadataMatch? best;
  for (final candidate in existing) {
    if (candidate.type != incoming.type) continue;
    if (incoming.year != null &&
        candidate.year != null &&
        incoming.year != candidate.year) {
      continue;
    }

    final titles = candidate.titles
        .map((title) => normalizeTitle(title.value))
        .where((title) => title.isNotEmpty)
        .toSet();
    if (incomingTitles.intersection(titles).isEmpty) continue;

    final confidence =
        incoming.year != null && candidate.year == incoming.year ? 0.9 : 0.75;
    final match = MetadataMatch(
      canonicalId: candidate.canonicalId,
      confidence: confidence,
      reason: incoming.year != null ? 'title-year' : 'title',
    );
    if (best == null || match.confidence > best.confidence) {
      best = match;
    }
  }

  return best;
}
