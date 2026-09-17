import 'package:core_domain/core_domain.dart';
import 'package:metadata_engine/metadata_engine.dart';
import 'package:test/test.dart';

CanonicalContent item(String id, String title, {int? year, List<ExternalId> ids = const [], ContentType type = ContentType.movie}) =>
    CanonicalContent(canonicalId: id, type: type, titles: [LocalizedTitle(languageTag: 'ar', value: title)], year: year, externalIds: ids);

void main() {
  test('external identifier is authoritative', () {
    final incoming = item('incoming', 'Different', ids: const [ExternalId(namespace: 'tmdb', value: '42')]);
    final existing = item('canonical', 'Canonical', ids: const [ExternalId(namespace: 'tmdb', value: '42')]);
    expect(matchCanonical(incoming, [existing])?.canonicalId, 'canonical');
    expect(matchCanonical(incoming, [existing])?.confidence, 1);
  });

  test('Arabic punctuation normalizes without transliteration', () {
    expect(normalizeTitle('  ذيب: العرب!  '), 'ذيب العرب');
  });

  test('title and year match without identifiers', () {
    expect(matchCanonical(item('i', '4BA!', year: 2026), [item('c', '4ba', year: 2026)])?.confidence, 0.9);
  });

  test('different known years do not deduplicate', () {
    expect(matchCanonical(item('i', 'Same', year: 2025), [item('c', 'Same', year: 2026)]), isNull);
  });

  test('different content types do not deduplicate by title', () {
    expect(matchCanonical(item('i', 'Same'), [item('c', 'Same', type: ContentType.series)]), isNull);
  });
}
