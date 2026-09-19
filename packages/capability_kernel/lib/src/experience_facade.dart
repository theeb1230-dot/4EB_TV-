import 'package:core_domain/core_domain.dart';

import 'kernel.dart';

/// Provider-neutral capability visibility for Experiences.
///
/// Presentation code receives stable capability availability only. Concrete
/// implementation/provider identities stay behind the composition boundary.
abstract interface class ExperienceCapabilityFacade {
  bool isAvailable(Capability capability);
  Set<Capability> get availableCapabilities;
}

final class KernelExperienceCapabilityFacade
    implements ExperienceCapabilityFacade {
  const KernelExperienceCapabilityFacade(this._kernel);

  final CapabilityKernel _kernel;

  @override
  bool isAvailable(Capability capability) =>
      _kernel.implementationsFor(capability).isNotEmpty;

  @override
  Set<Capability> get availableCapabilities =>
      Set.unmodifiable(_kernel.availableCapabilities);
}
