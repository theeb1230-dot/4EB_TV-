import 'dart:convert';

import 'local_data.dart';

/// Local watch state shared by History and Continue Watching surfaces.
///
/// This contract stores only local playback metadata. It does not contain
/// provider stream URLs, credentials, or network state.
final class WatchProgress {
  const WatchProgress({
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
      duration != null &&
      duration! > Duration.zero &&
      position >= duration!;
}

final class WatchProgressStore {
  const WatchProgressStore(this._store);

  final LocalKeyValueStore _store;

  Future<WatchProgress?> read(String contentId) async {
    final encoded = await _store.read(LocalDataScope.history, contentId);
    if (encoded == null) return null;
    try {
      final json = jsonDecode(encoded) as Map<String, dynamic>;
      final durationMs = json['durationMs'] as int?;
      return WatchProgress(
        contentId: contentId,
        position: Duration(milliseconds: json['positionMs'] as int),
        duration: durationMs == null ? null : Duration(milliseconds: durationMs),
        updatedAt: DateTime.parse(json['updatedAt'] as String).toUtc(),
        seasonNumber: json['seasonNumber'] as int?,
        episodeNumber: json['episodeNumber'] as int?,
      );
    } on Object {
      await _store.delete(LocalDataScope.history, contentId);
      return null;
    }
  }

  Future<void> write(WatchProgress progress) async {
    if (progress.position <= Duration.zero) {
      await _store.delete(LocalDataScope.history, progress.contentId);
      return;
    }
    await _store.write(
      LocalDataScope.history,
      progress.contentId,
      jsonEncode(<String, Object?>{
        'positionMs': progress.position.inMilliseconds,
        'durationMs': progress.duration?.inMilliseconds,
        'updatedAt': progress.updatedAt.toUtc().toIso8601String(),
        'seasonNumber': progress.seasonNumber,
        'episodeNumber': progress.episodeNumber,
      }),
    );
  }

  Future<void> clear(String contentId) =>
      _store.delete(LocalDataScope.history, contentId);
}
