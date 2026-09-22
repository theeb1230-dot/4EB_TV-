import 'dart:convert';

import 'package:core_domain/core_domain.dart';
import 'package:http/http.dart' as http;
import 'package:provider_sdk/provider_sdk.dart';

final class TvMazeProvider implements Provider, ContentDiscoveryProvider {
  TvMazeProvider({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;
  static final Uri _base = Uri.https('api.tvmaze.com');

  @override
  ProviderDescriptor get descriptor => const ProviderDescriptor(
        providerId: 'tvmaze',
        version: '1',
        capabilities: {
          Capability.catalog,
          Capability.metadata,
          Capability.search
        },
        configurationSchemaVersion: 1,
      );

  @override
  Future<List<CanonicalContent>> search(String query) async {
    final normalized = query.trim();
    if (normalized.isEmpty) return const [];
    final data = await _getJson(
      _base.replace(
        path: '/search/shows',
        queryParameters: {'q': normalized},
      ),
    );
    if (data is! List) return const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map((item) => item['show'])
        .whereType<Map<String, dynamic>>()
        .map(_show)
        .whereType<CanonicalContent>()
        .toList(growable: false);
  }

  @override
  Future<CanonicalContent?> details(String canonicalId) async {
    final id = _localId(canonicalId);
    if (id == null) return null;
    final data = await _getJson(
      _base.replace(path: '/shows/${id.toString()}'),
    );
    return data is Map<String, dynamic> ? _show(data) : null;
  }

  @override
  Future<List<EpisodeRef>> episodes(CanonicalContent content) async {
    final id = _localId(content.canonicalId);
    if (id == null) return const [];
    final data = await _getJson(
      _base.replace(path: '/shows/${id.toString()}/episodes'),
    );
    if (data is! List) return const [];
    return data
        .whereType<Map<String, dynamic>>()
        .map((item) {
          final season = item['season'];
          final number = item['number'];
          if (season is! num || number is! num) return null;
          return EpisodeRef(
            canonicalContentId: content.canonicalId,
            season: season.toInt(),
            episode: number.toInt(),
            title: item['name'] is String ? item['name'] as String : null,
          );
        })
        .whereType<EpisodeRef>()
        .toList(growable: false);
  }

  @override
  Future<ResolveResult> resolve(ResolveRequest request) async =>
      const ResolveResult(
        candidates: [],
        failures: [
          ResolveFailure(
            failureClass: ResolveFailureClass.unsupported,
            safeMessage: 'TVmaze provides metadata only.',
          ),
        ],
      );

  @override
  Future<Uri?> resolveDownload(ResolveRequest request) async => null;

  int? _localId(String canonicalId) {
    final value = canonicalId.startsWith('tvmaze:')
        ? canonicalId.substring('tvmaze:'.length)
        : canonicalId;
    return int.tryParse(value);
  }

  CanonicalContent? _show(Map<String, dynamic> show) {
    final id = show['id'];
    final name = show['name'];
    if (id is! num || name is! String || name.trim().isEmpty) return null;
    final premiered = show['premiered'];
    final year = premiered is String && premiered.length >= 4
        ? int.tryParse(premiered.substring(0, 4))
        : null;
    final genres = (show['genres'] as List?)
            ?.whereType<String>()
            .where((value) => value.trim().isNotEmpty)
            .toList(growable: false) ??
        const <String>[];
    final externalIds = <ExternalId>[
      ExternalId(namespace: 'tvmaze', value: id.toInt().toString()),
    ];
    final externals = show['externals'];
    if (externals is Map<String, dynamic>) {
      for (final entry in externals.entries) {
        final value = entry.value;
        if (value != null && value.toString().trim().isNotEmpty) {
          externalIds.add(
            ExternalId(namespace: entry.key, value: value.toString()),
          );
        }
      }
    }
    return CanonicalContent(
      canonicalId: 'tvmaze:${id.toInt().toString()}',
      type: ContentType.series,
      titles: [LocalizedTitle(languageTag: 'und', value: name.trim())],
      year: year,
      externalIds: externalIds,
      genres: genres,
    );
  }

  Future<Object?> _getJson(Uri uri) async {
    final response = await _client.get(uri, headers: const {
      'User-Agent': '4BA/0.1 metadata-client'
    }).timeout(const Duration(seconds: 8));
    if (response.statusCode == 429) {
      throw StateError('TVmaze rate limit reached');
    }
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError('TVmaze request failed');
    }
    return jsonDecode(response.body);
  }
}
