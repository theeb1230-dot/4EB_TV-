import 'package:core_domain/core_domain.dart';

import 'kernel.dart';

enum AdmissionDecision { admitted, disabled, unauthorized }

final class CapabilityAdmission {
  const CapabilityAdmission({
    required this.implementationId,
    required this.capabilities,
    required this.decision,
    this.priority = 0,
  });

  final String implementationId;
  final Set<Capability> capabilities;
  final AdmissionDecision decision;
  final int priority;
}

final class CapabilityAdmissionController {
  CapabilityAdmissionController(this.kernel);

  final CapabilityKernel kernel;

  bool apply(CapabilityAdmission admission) {
    kernel.unregister(admission.implementationId);
    if (admission.decision != AdmissionDecision.admitted) {
      return false;
    }
    kernel.register(CapabilityEndpoint(
      implementationId: admission.implementationId,
      capabilities: admission.capabilities,
      priority: admission.priority,
    ));
    return true;
  }
}
