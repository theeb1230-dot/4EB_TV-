import 'package:core_domain/core_domain.dart';
import 'package:metadata_engine/metadata_engine.dart';
import 'package:test/test.dart';

CanonicalContent item(
  String id,
  String title, {
  int? year,
  List<ExternalId> ids = const [],
  List<String> genres = const [],
  String language = 'ar',
}) => CanonicalContent(
  canonicalId: id,
  type: ContentType.movie,
  titles: [LocalizedTitle(languageTag: language, value: title)],
  year: year,
  externalIds: ids,
  genres: genres,
);

void main() {
  const aggregator = MetadataSearchAggregator();

  test('deduplicates cross-provider results by authoritative external id', () {
    final results = aggregator.aggregate([
      MetadataSearchBatch(
        items: [
          item(
            'first',
            'ذيب',
            ids: const [ExternalId(namespace: 'tmdb', value: '42')],
            genres: const ['action'],
          ),
        ],
      ),
      MetadataSearchBatch(
        items: [
          item(
            'second',
            'Theeb',
            ids: const [ExternalId(namespace: 'tmdb', value: '42')],
            genres: const ['drama'],
            language: 'en',
          ),
        ],
      ),
    ]);

    expect(results, hasLength(1));
    expect(results.single.canonicalId, 'first');
    expect(
      results.single.titles.map((title) => title.value),
      containsAll(['ذيب', 'Theeb']),
    );
    expect(results.single.genres, containsAll(['action', 'drama']));
  });

  test('keeps genuinely distinct results separate', () {
    final results = aggregator.aggregate([
      MetadataSearchBatch(items: [item('a', 'Same', year: 2025)]),
      MetadataSearchBatch(items: [item('b', 'Same', year: 2026)]),
    ]);

    expect(results.map((result) => result.canonicalId), ['a', 'b']);
  });

  test('result collection is immutable', () {
    final results = aggregator.aggregate([
      MetadataSearchBatch(items: [item('a', 'A')]),
    ]);

    expect(() => results.add(item('b', 'B')), throwsUnsupportedError);
  });
}
