import 'package:core_domain/core_domain.dart';
import 'package:provider_sdk/provider_sdk.dart';
import 'package:test/test.dart';

final class _StreamOnlyProvider implements Provider {
  const _StreamOnlyProvider(this.id);
  final String id;

  @override
  ProviderDescriptor get descriptor => ProviderDescriptor(
        providerId: id,
        version: '1',
        capabilities: const {Capability.stream},
        configurationSchemaVersion: 1,
      );

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async =>
      const ResolveResult(candidates: []);

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;
}

void main() {
  test('registry filters by declared capability', () {
    final registry = ProviderRegistry()
      ..register(const _StreamOnlyProvider('a'));
    expect(registry.supporting(Capability.stream), hasLength(1));
    expect(registry.supporting(Capability.download), isEmpty);
  });

  test('duplicate provider ids are rejected', () {
    final registry = ProviderRegistry()
      ..register(const _StreamOnlyProvider('a'));
    expect(
      () => registry.register(const _StreamOnlyProvider('a')),
      throwsStateError,
    );
  });

  test('unknown provider is disabled by default policy', () {
    const policy = ProviderPolicySet({});
    expect(policy.isEnabled('unknown'), isFalse);
  });
}
