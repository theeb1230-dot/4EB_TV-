enum ContentType { movie, series, anime, live, sport }

final class ExternalId {
  const ExternalId({required this.namespace, required this.value});
  final String namespace;
  final String value;
}

final class LocalizedTitle {
  const LocalizedTitle({required this.languageTag, required this.value});
  final String languageTag;
  final String value;
}

final class CanonicalContent {
  const CanonicalContent({
    required this.canonicalId,
    required this.type,
    required this.titles,
    this.year,
    this.externalIds = const <ExternalId>[],
    this.genres = const <String>[],
  });

  final String canonicalId;
  final ContentType type;
  final List<LocalizedTitle> titles;
  final int? year;
  final List<ExternalId> externalIds;
  final List<String> genres;
}

final class EpisodeRef {
  const EpisodeRef({
    required this.canonicalContentId,
    required this.season,
    required this.episode,
    this.absoluteEpisode,
    this.title,
  });

  final String canonicalContentId;
  final int season;
  final int episode;
  final int? absoluteEpisode;
  final String? title;
}
