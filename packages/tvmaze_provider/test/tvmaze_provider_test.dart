import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:tvmaze_provider/tvmaze_provider.dart';

void main() {
  test('maps search, details and episodes without stream capability', () async {
    final client = MockClient((request) async {
      if (request.url.path == '/search/shows') {
        return http.Response(
          '[{"show":{"id":7,"name":"Example","premiered":"2024-01-01","genres":["Drama"],"externals":{"imdb":"tt7"}}}]',
          200,
        );
      }
      if (request.url.path == '/shows/7') {
        return http.Response(
          '{"id":7,"name":"Example","premiered":"2024-01-01","genres":["Drama"],"externals":{"imdb":"tt7"}}',
          200,
        );
      }
      if (request.url.path == '/shows/7/episodes') {
        return http.Response(
          '[{"season":1,"number":2,"name":"Second"}]',
          200,
        );
      }
      return http.Response('', 404);
    });
    final provider = TvMazeProvider(client: client);
    final results = await provider.search('Example');
    expect(results.single.canonicalId, 'tvmaze:7');
    expect(results.single.year, 2024);
    expect((await provider.details('tvmaze:7'))?.genres, ['Drama']);
    final episodes = await provider.episodes(results.single);
    expect(episodes.single.episode, 2);
    expect(
      provider.descriptor.capabilities.any((c) => c.name == 'stream'),
      isFalse,
    );
  });
}
