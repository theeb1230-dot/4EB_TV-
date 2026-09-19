# 4BA Source Matrix

This is the canonical 30-root audit queue. Classification is evidence-backed where a source card exists, but **audit completion is controlled by `audits/PHASE1_ACCEPTANCE_LEDGER.md`**. A source may contribute to multiple categories. `PARTIAL` never means production admission.

| # | Source | Current classification | Primary audit focus | Audit status |
|---:|---|---|---|---|
| 01 | cinemalist-official-master | Experience / Reference | Exact GPLv3 snapshot matched; Flutter/TMDB/BLoC/local-state behavior retained only as clean-room reference; embedded default key/privacy-policy telemetry/external launcher excluded | AUDIT COMPLETE — EXPERIENCE_REFERENCE / CLEAN_ROOM |
| 02 | cinextma-master | Experience / Reference | Next.js/PWA UX; authoritative blob reads unavailable, so public MIT cannot authorize archive reuse; cloud/account/telemetry/provider behavior excluded | AUDIT COMPLETE — EXPERIENCE_REFERENCE / CLEAN_ROOM |
| 03 | ARB-S33-3-main | Provider / Reference | ArabSeed/Stremio contracts, authorization/license | PARTIAL — PROVIDER_PENDING |
| 04 | Cinemax-main | Experience / Reference | Android/Kotlin modular/design/performance concepts; unresolved NOTICE/assets/API-term reuse fails closed; no player/TV capability inferred | AUDIT COMPLETE — CONTRACT/EXPERIENCE_REFERENCE |
| 05 | ProxyFill-main | Unrelated / Reference | Evidence-backed exclusion complete: exact snapshot blobs, no bundle license, secret-handling defects, unrelated domain | AUDIT COMPLETE — EXCLUDED_RUNTIME |
| 06 | Mstch_Server2-main | Provider / Data / Reference | Canonical match/schedule/channel contracts only; unresolved playback rights/license fail closed; backend/streams excluded | AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING |
| 07 | Match-Archive-main | Provider / Data / Reference | Canonical historical-match/archive contracts only; unresolved replay/stream rights and root reuse fail closed | AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING |
| 08 | kiro-drama-main | Provider / Reference | Drama source capability, authorization/license | PARTIAL — PROVIDER_PENDING |
| 09 | alooytv-addon-main | Provider / Reference | Stremio addon capability, authorization/license | PARTIAL — PROVIDER_PENDING |
| 10 | Filmex-main | Experience / Reference | Flutter UX retained only as clean-room reference; missing license, Firebase/cloud, ads and WebView-first player excluded | AUDIT COMPLETE — EXPERIENCE_REFERENCE |
| 11 | getChanelFraom_dlstreams-main | Provider / Reference | Live channel data; private credentials/playlists excluded | PARTIAL — PROVIDER_PENDING |
| 12 | anthology-main | Provider / Engine / Reference | Turkish addon ecosystem; collection license/playability does not authorize endpoints/content; runtime remains independently gated | AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING |
| 13 | Al-Qahtani-main | Provider / Engine / Reference | Arabic/provider migration and fallback/validation contracts; media relay, IP telemetry, ads, external-browser and WebView-primary runtime excluded | AUDIT COMPLETE — CONTRACT/EXPERIENCE_REFERENCE / RUNTIME_REJECTED |
| 14 | NuvioStreamsAddon-master | Provider / Engine / Reference | Aggregation contracts, authorization/config/network evidence | PARTIAL — PROVIDER_PENDING |
| 15 | AIOStreams-main | Engine / Provider / Reference | Aggregation contracts only; license conflict plus proxy/bypass/torrent/debrid/relay runtime rejected | AUDIT COMPLETE — CLEAN_ROOM / CONTRACT_REFERENCE |
| 16 | aniyomi-main | Engine / Experience / Reference | Android/source/player contracts; provider authorization and native/file obligations gated | AUDIT COMPLETE — CONTRACT/ANDROID_REFERENCE |
| 17 | YacinTv--main | Provider / Data / Reference | Canonical channel/EPG contracts only; unresolved stream rights/license fail closed; private credentials/playlists excluded | AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING |
| 18 | xoxixoxi-main | Provider / Engine / Reference | Bounded worker/timeout/isolation contracts only; unresolved license/authorization/process/network safety fail closed; scraper/bypass/relay runtime excluded | AUDIT COMPLETE — CONTRACT_REFERENCE / RUNTIME_REJECTED |
| 19 | TRK_S-main | Provider / Reference | Turkish addon capability, authorization/license | PARTIAL — PROVIDER_PENDING |
| 20 | orien.live-main | Security-risk Reference | Credential-discovery behavior is constitution-incompatible; no execution/network contact/secrets required for safe closure | AUDIT COMPLETE — QUARANTINED / RUNTIME_EXCLUDED |
| 21 | Ytvplus2-main | Provider / Engine / Reference | Multi-source aggregation/fallback, authorization | PARTIAL — PROVIDER_PENDING |
| 22 | SportFree-main | Provider / Data / Reference | Sports metadata/fallback/health contracts only; unresolved playback rights/license fail closed; streams/runtime excluded | AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING |
| 23 | flixquest-main | Experience / Reference | Flutter/player/offline/TV UX clean-room reference; GPL, ads/analytics and proxy/scraper runtime excluded | AUDIT COMPLETE — EXPERIENCE_REFERENCE / CLEAN_ROOM |
| 24 | stremio-akwam.X-main | Provider / Engine / Reference | FastAPI/Stremio contracts, authorization/license/network evidence | PARTIAL — PROVIDER_PENDING |
| 25 | CinemaPress-master | Engine / Reference | Exact snapshot + MIT verified; CMS/catalog contracts retained, ads/privacy/player/backend runtime excluded | AUDIT COMPLETE — CONTRACT_REFERENCE |
| 26 | Cannels-arap-streem-main | Provider / Reference | Arabic live data; private credentials/playlists excluded | PARTIAL — PROVIDER_PENDING |
| 27 | CineSpot-main | Experience / Reference | Flutter discovery UX; missing license/provenance fails closed; Firebase/cloud/logger/external-browser/WebView-first behavior excluded | AUDIT COMPLETE — EXPERIENCE_REFERENCE / CLEAN_ROOM |
| 28 | aiometadata-dev | Metadata / Engine / Reference | Metadata mapping/cache concepts; Apache/GPL conflict blocks direct reuse; external APIs independently gated | AUDIT COMPLETE — METADATA_ENGINE_REFERENCE / CLEAN_ROOM |
| 29 | turkish-series-main | Provider / Engine / Reference | Large mutable Turkish corpus informs authorized snapshot/freshness/rollback contracts only; dataset/code reuse rights unresolved and runtime provider remains disabled | AUDIT COMPLETE — CONTRACT/DATA_REFERENCE / PROVIDER_PENDING |
| 30 | kiro-main | Provider / Reference | Source capability, authorization/license | PARTIAL — PROVIDER_PENDING |

## Status semantics

- **PARTIAL:** source-card evidence exists but one or more Phase-1 acceptance fields remain unresolved.
- **EXPERIENCE_REFERENCE / CONTRACT_REFERENCE:** clean-room behavior/contracts may inform 4BA; this is not implementation reuse approval.
- **PROVIDER_PENDING:** technical capability is known, but production admission is blocked pending evidence such as authorization/license/config/network safety.
- **BLOCKED:** direct code/runtime reuse is rejected under current evidence; clean-room concepts may still be allowed where documented.
- **QUARANTINED:** security/provenance risk forbids implementation/runtime use.
- **EXCLUDED_RUNTIME:** source is intentionally outside 4BA runtime; audit evidence must still justify exclusion.

## Required audit card per source

For every source record: provenance/version, language/framework, architecture, UI/UX, features, data models, APIs/contracts, player behavior, providers, dependencies, update mechanism, tests, performance concerns, network/security behavior, secrets scan, advertising/tracking scan, license and redistribution constraints, reusable code, reusable clean-room concepts, 4BA destination, migration strategy, risk rating, and evidence paths.

## Gate

No source implementation is merged into 4BA Core merely because it works in isolation. It must pass license/security review and be adapted behind 4BA contracts. Providers never bind directly to UI. Credentials are never copied. Advertising SDKs, ad tracking, popups and pre-roll are rejected. Paid dependencies cannot become mandatory. DRM/paywall/access-control bypass is excluded. Source assets require their own licensing evidence where applicable.
