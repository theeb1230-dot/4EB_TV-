# Deep Audit Wave 3 — Turkish, Backend and Live-source Projects

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`
Source: authoritative connected bundle. This document records architecture/security evidence, not approval of third-party endpoints.

## turkish-series-main
- 18,082 files. Mixed Android/Kotlin + Python tooling + very large JSON catalog/data surface.
- Classification: **Provider + Engine + Reference**.
- Primary value: Turkish catalog/episode data modeling, scheduled data-refresh concepts, client/data separation.
- Risks: huge generated-data footprint, freshness/update coupling, source authorization and redistribution rights must be checked separately.
- 4BA destination: Turkish section metadata/provider concepts. Do not bundle massive mutable catalogs into Core; prefer bounded local cache and provider-owned updates.

## xoxixoxi-main
- 6,711 files. Node/backend-oriented with browser automation/media tooling signals.
- Classification: **Provider + Engine + Reference**.
- Risks: Puppeteer/ffmpeg/backend execution is unsuitable as a mandatory ZERO_COST client dependency and can create high compute/bandwidth cost.
- 4BA destination: failure classification and provider-health concepts only where authorized. No mandatory scraping backend, no video relay, no protection bypass.

## Ytvplus2-main
- Multi-source backend/provider project.
- Classification: **Provider + Engine**.
- Value: provider aggregation/fallback and normalization concepts.
- Risks: provider-specific network contracts, endpoint volatility and authorization. UI must never depend on these contracts directly.
- 4BA destination: Provider SDK adapters only for sources proven authorized; resolver owns ranking/fallback.

## Live/sports source family
Projects reviewed as a risk family:
- `Mstch_Server2-main`
- `Match-Archive-main`
- `getChanelFraom_dlstreams-main`
- `YacinTv--main`
- `SportFree-main`
- `Cannels-arap-streem-main`
- `orien.live-main`

Classification is predominantly **Provider/Reference**, not Experience.

### 4BA hard rules
1. Playlist/channel/match data does not imply redistribution permission.
2. Credentials, cookies, bearer tokens, usernames/passwords and private playlist URLs are never copied.
3. `orien.live-main` remains quarantined because its purpose/evidence includes credential-discovery style behavior. It is **not** an implementation source.
4. Live/Sports UI consumes normalized 4BA Channel/Program/Match contracts, never source JSON directly.
5. EPG and match schedules are metadata capabilities separate from stream resolution.
6. Stream availability is health-scored locally; no single source becomes a mandatory dependency.
7. Backend scraping/proxying is not a prerequisite for core app operation.

## Architecture extraction
The wave reinforces four production boundaries:
- **LiveMetadataProvider**: channels, categories, EPG, match schedules.
- **LiveStreamProvider**: authorized playback candidates only.
- **Resolver/Health**: candidate ranking, failure isolation and fallback.
- **Experience**: provider-agnostic Live/Sports UI.

Watch and Download remain separate capabilities. A live provider does not gain download capability by implication.

## Status
These projects have classification/risk/architecture evidence, but file-level license, exact dependency, network and authorization review remains required before any provider can be enabled in production.
