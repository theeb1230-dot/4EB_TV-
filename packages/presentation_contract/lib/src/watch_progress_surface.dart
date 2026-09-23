import 'package:core_domain/core_domain.dart';

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

  factory WatchProgressSurfaceItem.fromDomain(WatchProgress progress) =>
      WatchProgressSurfaceItem(
        contentId: progress.contentId,
        position: progress.position,
        duration: progress.duration,
        updatedAt: progress.updatedAt,
        seasonNumber: progress.seasonNumber,
        episodeNumber: progress.episodeNumber,
      );

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

/// Reads the local History/Continue Watching source without exposing storage
/// or provider implementation details to presentation code.
final class WatchProgressSurfaceReader {
  const WatchProgressSurfaceReader(this._store);

  final WatchProgressStore _store;

  Future<WatchProgressSurfaceItem?> read(String contentId) async {
    final progress = await _store.read(contentId);
    return progress == null
        ? null
        : WatchProgressSurfaceItem.fromDomain(progress);
  }
}
