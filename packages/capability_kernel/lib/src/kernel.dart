import 'package:core_domain/core_domain.dart';

final class CapabilityEndpoint {
  const CapabilityEndpoint({
    required this.implementationId,
    required this.capabilities,
    this.priority = 0,
  });
  final String implementationId;
  final Set<Capability> capabilities;
  final int priority;
  bool supports(Capability capability) => capabilities.contains(capability);
}

final class CapabilityKernel {
  final Map<String, CapabilityEndpoint> _endpoints = {};

  void register(CapabilityEndpoint endpoint) {
    if (endpoint.implementationId.trim().isEmpty) {
      throw ArgumentError.value(endpoint.implementationId, 'implementationId', 'must not be empty');
    }
    if (endpoint.capabilities.isEmpty) {
      throw ArgumentError.value(endpoint.capabilities, 'capabilities', 'must not be empty');
    }
    if (_endpoints.containsKey(endpoint.implementationId)) {
      throw StateError('Duplicate capability implementation');
    }
    _endpoints[endpoint.implementationId] = endpoint;
  }

  bool unregister(String implementationId) => _endpoints.remove(implementationId) != null;

  List<CapabilityEndpoint> implementationsFor(Capability capability) {
    final matches = _endpoints.values.where((endpoint) => endpoint.supports(capability)).toList(growable: false);
    matches.sort((a, b) {
      final priority = b.priority.compareTo(a.priority);
      return priority != 0 ? priority : a.implementationId.compareTo(b.implementationId);
    });
    return List.unmodifiable(matches);
  }

  Set<Capability> get availableCapabilities =>
      Set.unmodifiable(_endpoints.values.expand((endpoint) => endpoint.capabilities).toSet());
}
