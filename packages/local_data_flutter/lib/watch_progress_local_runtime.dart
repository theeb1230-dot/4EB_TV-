import 'dart:convert';

import 'package:core_domain/core_domain.dart';
import 'package:presentation_contract/presentation_contract.dart';

const _watchProgressKey = 'watch-progress-v1';

/// Local-first composition adapter for watch progress.
///
/// It owns persistence/composition only. Presentation remains dependent on the
/// presentation-safe surface model, while providers and stream URLs stay out
/// of this boundary.
final class WatchProgressLocalRuntime {
  WatchProgressLocalRuntime(this.store);

  final LocalKeyValueStore store;

  Future<WatchProgressSurfaceCollection> load() async {
    final encoded = await store.read(
      LocalDataScope.playbackProgress,
      _watchProgressKey,
    );
    if (encoded == null || encoded.isEmpty) {
      return WatchProgressSurfaceCollection(
        <WatchProgressSurfaceItem>[],
      );
    }

    try {
      final decoded = jsonDecode(encoded);
      if (decoded is! List<Object?>) {
        return WatchProgressSurfaceCollection(
          <WatchProgressSurfaceItem>[],
        );
      }
      return WatchProgressSurfaceCollection(
        decoded.whereType<Map<String, Object?>>().map(_decodeItem),
      );
    } on FormatException {
      return WatchProgressSurfaceCollection(
        <WatchProgressSurfaceItem>[],
      );
    }
  }

  Future<void> save(WatchProgressSurfaceCollection collection) {
    final payload = jsonEncode(
      collection.history.map(_encodeItem).toList(growable: false),
    );
    return store.write(
      LocalDataScope.playbackProgress,
      _watchProgressKey,
      payload,
    );
  }

  Future<void> clear() =>
      store.delete(LocalDataScope.playbackProgress, _watchProgressKey);

  WatchProgressSurfaceItem _decodeItem(Map<String, Object?> json) {
    final contentId = json['contentId'];
    final positionMs = json['positionMs'];
    final durationMs = json['durationMs'];
    final updatedAt = json['updatedAt'];
    if (contentId is! String || positionMs is! num || updatedAt is! String) {
      throw const FormatException('Invalid watch progress item');
    }

    return WatchProgressSurfaceItem(
      contentId: contentId,
      position: Duration(milliseconds: positionMs.toInt()),
      duration:
          durationMs is num ? Duration(milliseconds: durationMs.toInt()) : null,
      updatedAt: DateTime.parse(updatedAt).toUtc(),
      seasonNumber: (json['seasonNumber'] as num?)?.toInt(),
      episodeNumber: (json['episodeNumber'] as num?)?.toInt(),
    );
  }

  Map<String, Object?> _encodeItem(WatchProgressSurfaceItem item) =>
      <String, Object?>{
        'contentId': item.contentId,
        'positionMs': item.position.inMilliseconds,
        'durationMs': item.duration?.inMilliseconds,
        'updatedAt': item.updatedAt.toUtc().toIso8601String(),
        'seasonNumber': item.seasonNumber,
        'episodeNumber': item.episodeNumber,
      };
}
