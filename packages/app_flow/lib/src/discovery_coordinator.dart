import 'package:core_domain/core_domain.dart';
import 'package:metadata_engine/metadata_engine.dart';
import 'package:provider_sdk/provider_sdk.dart';

final class DiscoverySearchResult {
  const DiscoverySearchResult({
    required this.items,
    this.failedProviders = const <String>[],
  });

  final List<CanonicalContent> items;
  final List<String> failedProviders;
}

final class DiscoveryCoordinator {
  const DiscoveryCoordinator({
    required ProviderRegistry registry,
    MetadataSearchAggregator aggregator = const MetadataSearchAggregator(),
  })  : _registry = registry,
        _aggregator = aggregator;

  final ProviderRegistry _registry;
  final MetadataSearchAggregator _aggregator;

  Future<DiscoverySearchResult> search(String query) async {
    final normalized = query.trim();
    if (normalized.isEmpty) {
      return const DiscoverySearchResult(items: <CanonicalContent>[]);
    }

    final batches = <MetadataSearchBatch>[];
    final failures = <String>[];
    for (final provider in _registry.discoveryProviders()) {
      try {
        final items = await provider.search(normalized);
        batches.add(MetadataSearchBatch(items: items));
      } on Exception {
        failures.add(provider.descriptor.providerId);
      }
    }

    return DiscoverySearchResult(
      items: _aggregator.aggregate(batches),
      failedProviders: List.unmodifiable(failures),
    );
  }

  Future<CanonicalContent?> details(String canonicalId) async {
    for (final provider in _registry.discoveryProviders()) {
      try {
        final result = await provider.details(canonicalId);
        if (result != null) return result;
      } on Exception {
        continue;
      }
    }
    return null;
  }

  Future<List<EpisodeRef>> episodes(CanonicalContent content) async {
    for (final provider in _registry.discoveryProviders()) {
      try {
        final items = await provider.episodes(content);
        if (items.isNotEmpty) return List.unmodifiable(items);
      } on Exception {
        continue;
      }
    }
    return const <EpisodeRef>[];
  }
}
