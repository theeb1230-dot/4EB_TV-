import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('routes by capability without provider-specific state', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized-a',
        capabilities: {Capability.search, Capability.metadata},
        priority: 10,
      ))
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized-b',
        capabilities: {Capability.search},
        priority: 20,
      ));
    expect(
        kernel
            .implementationsFor(Capability.search)
            .map((e) => e.implementationId),
        ['authorized-b', 'authorized-a']);
    expect(kernel.implementationsFor(Capability.stream), isEmpty);
  });

  test('rejects duplicate implementations', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'one',
        capabilities: {Capability.catalog},
      ));
    expect(
      () => kernel.register(const CapabilityEndpoint(
        implementationId: 'one',
        capabilities: {Capability.search},
      )),
      throwsStateError,
    );
  });

  test('unregister provides a local kill-switch boundary', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'one',
        capabilities: {Capability.stream},
      ));
    expect(kernel.availableCapabilities, contains(Capability.stream));
    expect(kernel.unregister('one'), isTrue);
    expect(kernel.implementationsFor(Capability.stream), isEmpty);
  });
}
