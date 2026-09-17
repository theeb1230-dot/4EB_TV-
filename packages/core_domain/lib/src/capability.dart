enum Capability {
  catalog,
  metadata,
  search,
  stream,
  download,
  subtitle,
  live,
  epg,
}

final class ProviderDescriptor {
  const ProviderDescriptor({
    required this.providerId,
    required this.version,
    required this.capabilities,
    required this.configurationSchemaVersion,
  });

  final String providerId;
  final String version;
  final Set<Capability> capabilities;
  final int configurationSchemaVersion;

  bool supports(Capability capability) => capabilities.contains(capability);
}
