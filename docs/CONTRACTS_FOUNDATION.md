# 4BA Contracts Foundation

These are language-neutral contracts to freeze semantics before choosing runtime packages.

## CanonicalContent
Fields: canonicalId, type(movie/series/anime/live/sport), localizedTitles, year, externalIds, artwork, genres, maturity metadata, provenance.

## EpisodeRef
Fields: canonicalContentId, season, episode, absoluteEpisode?, title?, airDate?, duration?, externalIds.

## Capability
Values are independently declarable: catalog, metadata, search, stream, download, subtitle, live, epg. Supporting stream never implies download.

## ProviderDescriptor
Fields: providerId (diagnostics only), version, capabilities, regions/languages when declared, configuration schema version, health policy, privacy/network declaration.

## PlaybackCandidate
Fields: candidateId, protocol(hls/dash/mp4/webFallback), uri, quality?, bitrate?, audio?, subtitles?, expiry?, requestOptions?, downloadable, healthEvidence. Provider display name is not required in normal UI.

## ResolveRequest
Canonical content/episode identity, requested playback constraints, language/audio/subtitle preferences, data-saver policy and platform capabilities. No PII.

## ResolveResult
Ordered candidates plus sanitized failure reasons. Ranking is based on health/success/latency/quality/freshness and policy, not hard-coded UI preference.

## PlaybackCheckpoint
Canonical content/episode, position, duration, updatedAt and completed flag. It is provider-independent so fallback can resume at the same position.

## ExperienceDescriptor
Experience ID, localized name, compatible capability requirements, token overrides, navigation definition and supported form factors. It cannot embed provider credentials/endpoints.

## SignedConfigEnvelope
Schema version, config version, issuedAt, expiresAt?, payload hash, signature, provider states/order/policies and rollback metadata. Secret material is forbidden.

## HealthObservation
Anonymous/local observation: provider/candidate opaque ID, operation, success/failure class, latency, quality and timestamp. No user identity, search text or watched title is required.

## Contract tests required later
Provider capability declaration, metadata/stream separation, watch/download independence, fallback checkpoint preservation, kill-switch behavior, malformed signed-config rollback, RTL Experience compatibility and TV focus navigation.
