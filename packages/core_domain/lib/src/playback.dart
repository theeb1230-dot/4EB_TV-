enum PlaybackProtocol { hls, dash, mp4, webFallback }

final class PlaybackCandidate {
  const PlaybackCandidate({
    required this.candidateId,
    required this.protocol,
    required this.uri,
    required this.downloadable,
    this.qualityLabel,
    this.bitrate,
    this.expiresAt,
  });

  final String candidateId;
  final PlaybackProtocol protocol;
  final Uri uri;
  final bool downloadable;
  final String? qualityLabel;
  final int? bitrate;
  final DateTime? expiresAt;
}

final class PlaybackCheckpoint {
  const PlaybackCheckpoint({
    required this.canonicalContentId,
    required this.position,
    required this.duration,
    required this.updatedAt,
    required this.completed,
    this.season,
    this.episode,
  });

  final String canonicalContentId;
  final Duration position;
  final Duration duration;
  final DateTime updatedAt;
  final bool completed;
  final int? season;
  final int? episode;
}
