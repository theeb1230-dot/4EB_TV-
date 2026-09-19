import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('experience sees capability availability without implementation ids',
      () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized-provider-hidden-from-ui',
        capabilities: {Capability.search, Capability.metadata},
      ));
    final facade = KernelExperienceCapabilityFacade(kernel);

    expect(facade.isAvailable(Capability.search), isTrue);
    expect(facade.isAvailable(Capability.stream), isFalse);
    expect(
      facade.availableCapabilities,
      containsAll(<Capability>{Capability.search, Capability.metadata}),
    );
  });

  test('experience facade reflects kill switch immediately', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'implementation-a',
        capabilities: {Capability.stream},
      ));
    final facade = KernelExperienceCapabilityFacade(kernel);

    expect(facade.isAvailable(Capability.stream), isTrue);
    kernel.unregister('implementation-a');
    expect(facade.isAvailable(Capability.stream), isFalse);
  });
}
