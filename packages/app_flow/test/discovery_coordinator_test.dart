import 'package:app_flow/app_flow.dart';
import 'package:core_domain/core_domain.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:test/test.dart';

final class DiscoveryProvider implements Provider, ContentDiscoveryProvider {
  DiscoveryProvider(this.id, this.items, {this.fail = false});

  final String id;
  final List<CanonicalContent> items;
  final bool fail;

  @override
  ProviderDescriptor get descriptor => ProviderDescriptor(
        providerId: id,
        version: '1',
        capabilities: const {Capability.search, Capability.metadata},
        configurationSchemaVersion: 1,
      );

  @override
  Future<List<CanonicalContent>> search(String query) async {
    if (fail) throw Exception('offline');
    return items;
  }

  @override
  Future<CanonicalContent?> details(String canonicalId) async =>
      items.where((item) => item.canonicalId == canonicalId).firstOrNull;

  @override
  Future<List<EpisodeRef>> episodes(CanonicalContent content) async => const [];

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async =>
      const ResolveResult(candidates: []);

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;
}

void main() {
  test('aggregates discovery providers and isolates provider failure',
      () async {
    const item = CanonicalContent(
      canonicalId: 'one',
      type: ContentType.movie,
      titles: [LocalizedTitle(languageTag: 'ar', value: 'واحد')],
    );
    final registry = ProviderRegistry()
      ..register(DiscoveryProvider('good', const [item]))
      ..register(DiscoveryProvider('bad', const [], fail: true));

    final result =
        await DiscoveryCoordinator(registry: registry).search(' واحد ');

    expect(result.items, hasLength(1));
    expect(result.failedProviders, ['bad']);
  });

  test('empty query fails closed without calling providers', () async {
    final registry = ProviderRegistry()
      ..register(DiscoveryProvider('bad', const [], fail: true));

    final result = await DiscoveryCoordinator(registry: registry).search('   ');

    expect(result.items, isEmpty);
    expect(result.failedProviders, isEmpty);
  });
}
