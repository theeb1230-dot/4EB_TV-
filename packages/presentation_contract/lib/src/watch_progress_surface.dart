/// Presentation-safe projection of local watch state.
///
/// This keeps provider streams and storage concerns out of UI-facing models.
final class WatchProgressSurfaceItem {
  const WatchProgressSurfaceItem({
    required this.contentId,
    required this.position,
    required this.duration,
    required this.updatedAt,
    this.seasonNumber,
    this.episodeNumber,
  });

  final String contentId;
  final Duration position;
  final Duration? duration;
  final DateTime updatedAt;
  final int? seasonNumber;
  final int? episodeNumber;

  bool get isCompleted =>
      duration != null && duration! > Duration.zero && position >= duration!;

  double? get progressFraction {
    final total = duration;
    if (total == null || total <= Duration.zero) return null;
    final fraction = position.inMilliseconds / total.inMilliseconds;
    return fraction.clamp(0.0, 1.0);
  }
}

/// Presentation-side reader contract. Infrastructure adapters can implement
/// this without making the presentation package depend on storage or domain
/// packages.
abstract interface class WatchProgressSurfaceReader {
  Future<WatchProgressSurfaceItem?> read(String contentId);
}
