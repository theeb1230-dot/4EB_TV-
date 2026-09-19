import 'package:capability_kernel/capability_kernel.dart';
import 'package:core_domain/core_domain.dart';

/// Stable presentation identity. It intentionally contains no provider state.
final class ExperienceDescriptor {
  const ExperienceDescriptor({
    required this.id,
    required this.displayName,
    required this.requiredCapabilities,
  });

  final String id;
  final String displayName;
  final Set<Capability> requiredCapabilities;
}

/// Provider-blind context supplied to an Experience by the composition root.
final class ExperienceContext {
  const ExperienceContext({
    required this.capabilities,
  });

  final ExperienceCapabilityFacade capabilities;

  bool canActivate(ExperienceDescriptor descriptor) =>
      descriptor.requiredCapabilities.every(capabilities.isAvailable);
}
