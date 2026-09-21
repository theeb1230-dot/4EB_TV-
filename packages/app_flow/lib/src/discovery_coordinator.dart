import 'package:core_domain/core_domain.dart';
import 'package:metadata_engine/metadata_engine.dart';
import 'package:provider_sdk/provider_sdk.dart';

final class ProviderContentLocator {
  const ProviderContentLocator({
    required this.providerId,
    required this.providerContentId,
  });

  final String providerId;
  final String providerContentId;
}

final class DiscoverySearchResult {
  const DiscoverySearchResult({
    required this.items,
    this.failedProviders = const <String>[],
    this.locators = const <String, List<ProviderContentLocator>>{},
  });

  final List<CanonicalContent> items;
  final List<String> failedProviders;
  final Map<String, List<ProviderContentLocator>> locators;

  List<ProviderContentLocator> locatorsFor(String canonicalId) =>
      locators[canonicalId] ?? const <ProviderContentLocator>[];
}

final class DiscoveryCoordinator {
  const DiscoveryCoordinator({
    required ProviderRegistry registry,
    MetadataSearchAggregator aggregator = const MetadataSearchAggregator(),
  })  : _registry = registry,
        _aggregator = aggregator;

  final ProviderRegistry _registry;
  final MetadataSearchAggregator _aggregator;

  bool get hasDiscoveryProviders => _registry.discoveryProviders().isNotEmpty;

  Future<DiscoverySearchResult> search(String query) async {
    final normalized = query.trim();
    if (normalized.isEmpty) {
      return const DiscoverySearchResult(items: <CanonicalContent>[]);
    }

    final batches = <MetadataSearchBatch>[];
    final failures = <String>[];
    final sources = <({String providerId, CanonicalContent item})>[];
    for (final provider in _registry.discoveryProviders()) {
      try {
        final items = await provider.search(normalized);
        batches.add(MetadataSearchBatch(items: items));
        for (final item in items) {
          sources.add((providerId: provider.descriptor.providerId, item: item));
        }
      } on Exception {
        failures.add(provider.descriptor.providerId);
      }
    }

    final items = _aggregator.aggregate(batches);
    final locators = <String, List<ProviderContentLocator>>{};
    for (final item in items) {
      locators[item.canonicalId] = List.unmodifiable(
        sources
            .where((source) => matchCanonical(source.item, [item]) != null)
            .map(
              (source) => ProviderContentLocator(
                providerId: source.providerId,
                providerContentId: source.item.canonicalId,
              ),
            ),
      );
    }

    return DiscoverySearchResult(
      items: items,
      failedProviders: List.unmodifiable(failures),
      locators: Map.unmodifiable(locators),
    );
  }

  Future<CanonicalContent?> details(
    String canonicalId, {
    List<ProviderContentLocator> locators = const <ProviderContentLocator>[],
  }) async {
    for (final locator in locators) {
      final registered = _registry.byId(locator.providerId);
      if (registered is! ContentDiscoveryProvider) continue;
      final provider = registered as ContentDiscoveryProvider;
      try {
        final result = await provider.details(locator.providerContentId);
        if (result != null) return result;
      } on Exception {
        continue;
      }
    }
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

  Future<List<EpisodeRef>> episodes(
    CanonicalContent content, {
    List<ProviderContentLocator> locators = const <ProviderContentLocator>[],
  }) async {
    for (final locator in locators) {
      final registered = _registry.byId(locator.providerId);
      if (registered is! ContentDiscoveryProvider) continue;
      final provider = registered as ContentDiscoveryProvider;
      try {
        final providerContent =
            await provider.details(locator.providerContentId);
        if (providerContent == null) continue;
        final items = await provider.episodes(providerContent);
        if (items.isNotEmpty) return List.unmodifiable(items);
      } on Exception {
        continue;
      }
    }
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
