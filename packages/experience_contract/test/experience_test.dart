import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:experience_contract/experience_contract.dart';
import 'package:test/test.dart';

void main() {
  test('activation follows capability availability', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'implementation-a',
        capabilities: {Capability.search, Capability.metadata},
      ));
    final context = ExperienceContext(
      capabilities: ExperienceCapabilityFacade(kernel),
    );
    const experience = ExperienceDescriptor(
      id: '4ba-cinematic-gold',
      displayName: '4BA Cinematic Gold',
      requiredCapabilities: {Capability.search, Capability.metadata},
    );

    expect(context.canActivate(experience), isTrue);
    kernel.unregister('implementation-a');
    expect(context.canActivate(experience), isFalse);
  });
}
