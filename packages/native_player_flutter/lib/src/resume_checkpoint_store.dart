import 'dart:convert';

import 'package:core_domain/core_domain.dart';

final class ResumeCheckpoint {
  const ResumeCheckpoint({
    required this.contentId,
    required this.position,
    required this.updatedAt,
  });

  final String contentId;
  final Duration position;
  final DateTime updatedAt;
}

final class ResumeCheckpointStore {
  const ResumeCheckpointStore(this._store);

  final LocalKeyValueStore _store;

  Future<ResumeCheckpoint?> read(String contentId) async {
    final encoded = await _store.read(LocalDataScope.playbackProgress, contentId);
    if (encoded == null) return null;
    try {
      final json = jsonDecode(encoded) as Map<String, dynamic>;
      return ResumeCheckpoint(
        contentId: contentId,
        position: Duration(milliseconds: json['positionMs'] as int),
        updatedAt: DateTime.parse(json['updatedAt'] as String).toUtc(),
      );
    } on Object {
      await _store.delete(LocalDataScope.playbackProgress, contentId);
      return null;
    }
  }

  Future<void> write({
    required String contentId,
    required Duration position,
    required DateTime updatedAt,
  }) {
    if (position <= Duration.zero) {
      return _store.delete(LocalDataScope.playbackProgress, contentId);
    }
    return _store.write(
      LocalDataScope.playbackProgress,
      contentId,
      jsonEncode(<String, Object>{
        'positionMs': position.inMilliseconds,
        'updatedAt': updatedAt.toUtc().toIso8601String(),
      }),
    );
  }

  Future<void> clear(String contentId) =>
      _store.delete(LocalDataScope.playbackProgress, contentId);
}
