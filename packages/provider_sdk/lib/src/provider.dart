import 'package:core_domain/core_domain.dart';

abstract interface class Provider {
  ProviderDescriptor get descriptor;

  Future<ResolveResult> resolve(ResolveRequest request);

  /// Optional capabilities must fail closed rather than pretending support.
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;
}

final class ProviderRegistry {
  final Map<String, Provider> _providers = <String, Provider>{};

  void register(Provider provider) {
    final id = provider.descriptor.providerId.trim();
    if (id.isEmpty) {
      throw ArgumentError.value(id, 'providerId', 'must not be empty');
    }
    if (_providers.containsKey(id)) {
      throw StateError('Duplicate providerId');
    }
    _providers[id] = provider;
  }

  List<Provider> supporting(Capability capability) => List.unmodifiable(
        _providers.values.where((p) => p.descriptor.supports(capability)),
      );

  Provider? byId(String providerId) => _providers[providerId];
}
