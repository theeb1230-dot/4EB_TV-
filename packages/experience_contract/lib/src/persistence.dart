abstract interface class ExperienceSelectionStore {
  Future<String?> readActiveId();

  /// Atomically replaces the persisted active Experience id.
  Future<void> writeActiveId(String id);
}

final class ExperienceSelectionSnapshot {
  const ExperienceSelectionSnapshot({required this.activeId});

  final String activeId;
}
