import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';
import 'package:test/test.dart';

void main() {
  test('admits only explicitly authorized and enabled implementation', () {
    final kernel = CapabilityKernel();
    final admission = CapabilityAdmissionController(kernel);

    expect(
      admission.apply(const CapabilityAdmission(
        implementationId: 'provider-a',
        capabilities: {Capability.search},
        decision: AdmissionDecision.admitted,
      )),
      isTrue,
    );
    expect(kernel.implementationsFor(Capability.search), hasLength(1));

    expect(
      admission.apply(const CapabilityAdmission(
        implementationId: 'provider-a',
        capabilities: {Capability.search},
        decision: AdmissionDecision.disabled,
      )),
      isFalse,
    );
    expect(kernel.implementationsFor(Capability.search), isEmpty);
  });

  test('unauthorized implementation fails closed', () {
    final kernel = CapabilityKernel();
    final admission = CapabilityAdmissionController(kernel);

    expect(
      admission.apply(const CapabilityAdmission(
        implementationId: 'unknown',
        capabilities: {Capability.stream},
        decision: AdmissionDecision.unauthorized,
      )),
      isFalse,
    );
    expect(kernel.availableCapabilities, isEmpty);
  });
}
