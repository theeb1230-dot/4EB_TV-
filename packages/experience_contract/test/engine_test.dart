import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:experience_contract/experience_contract.dart';
import 'package:test/test.dart';

void main() {
  const gold = ExperienceDescriptor(
    id: '4ba-cinematic-gold',
    displayName: '4BA Cinematic Gold',
    requiredCapabilities: {Capability.search},
  );
  const alternate = ExperienceDescriptor(
    id: 'alternate',
    displayName: 'Alternate',
    requiredCapabilities: {Capability.metadata},
  );

  test('preview never changes active Experience until apply', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized',
        capabilities: {Capability.search, Capability.metadata},
      ));
    final context = ExperienceContext(
      capabilities: KernelExperienceCapabilityFacade(kernel),
    );
    final engine = ExperienceEngine(defaultExperience: gold)
      ..register(alternate);

    expect(engine.preview('alternate', context), isTrue);
    expect(engine.activeId, gold.id);
    expect(engine.previewId, alternate.id);
    expect(engine.applyPreview(context), isTrue);
    expect(engine.activeId, alternate.id);
    expect(engine.previewId, isNull);
  });

  test('apply fails closed if required capability disappears', () {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized',
        capabilities: {Capability.search, Capability.metadata},
      ));
    final context = ExperienceContext(
      capabilities: KernelExperienceCapabilityFacade(kernel),
    );
    final engine = ExperienceEngine(defaultExperience: gold)
      ..register(alternate);

    expect(engine.preview('alternate', context), isTrue);
    kernel.unregister('authorized');
    expect(engine.applyPreview(context), isFalse);
    expect(engine.activeId, gold.id);
    expect(engine.previewId, isNull);
  });

  test('engine state contains no user library or playback state', () {
    final engine = ExperienceEngine(defaultExperience: gold);
    expect(engine.registered.single.id, gold.id);
    expect(engine.activeId, gold.id);
  });
}
