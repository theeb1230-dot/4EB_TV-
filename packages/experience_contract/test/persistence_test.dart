import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:experience_contract/experience_contract.dart';
import 'package:test/test.dart';

final class MemoryStore implements ExperienceSelectionStore {
  String? value;
  bool failWrites = false;

  @override
  Future<String?> readActiveId() async => value;

  @override
  Future<void> writeActiveId(String id) async {
    if (failWrites) throw StateError('write failed');
    value = id;
  }
}

void main() {
  const gold = ExperienceDescriptor(
    id: '4ba-cinematic-gold',
    displayName: '4BA Cinematic Gold',
    requiredCapabilities: {Capability.search},
  );
  const alternate = ExperienceDescriptor(
    id: 'alternate',
    displayName: 'Alternate',
    requiredCapabilities: {Capability.search},
  );

  ExperienceContext context() {
    final kernel = CapabilityKernel()
      ..register(const CapabilityEndpoint(
        implementationId: 'authorized',
        capabilities: {Capability.search},
      ));
    return ExperienceContext(
      capabilities: KernelExperienceCapabilityFacade(kernel),
    );
  }

  test('persisted apply changes memory only after durable write succeeds',
      () async {
    final engine = ExperienceEngine(defaultExperience: gold)
      ..register(alternate);
    final store = MemoryStore()..failWrites = true;
    expect(engine.preview(alternate.id, context()), isTrue);

    await expectLater(
      engine.applyPreviewPersisted(context(), store),
      throwsStateError,
    );
    expect(engine.activeId, gold.id);
    expect(engine.previewId, alternate.id);

    store.failWrites = false;
    expect(await engine.applyPreviewPersisted(context(), store), isTrue);
    expect(store.value, alternate.id);
    expect(engine.activeId, alternate.id);
    expect(engine.previewId, isNull);
  });

  test('restore fails closed for unknown persisted Experience', () async {
    final engine = ExperienceEngine(defaultExperience: gold);
    final store = MemoryStore()..value = 'removed-experience';
    expect(await engine.restore(context(), store), isFalse);
    expect(engine.activeId, gold.id);
  });
}
