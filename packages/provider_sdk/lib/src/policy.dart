final class ProviderPolicy {
  const ProviderPolicy({
    required this.enabled,
    this.priority = 0,
  });

  final bool enabled;
  final int priority;
}

final class ProviderPolicySet {
  const ProviderPolicySet(this.providers);

  final Map<String, ProviderPolicy> providers;

  bool isEnabled(String providerId) => providers[providerId]?.enabled ?? false;

  int priorityOf(String providerId) => providers[providerId]?.priority ?? 0;
}
