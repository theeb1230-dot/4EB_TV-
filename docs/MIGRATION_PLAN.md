# 4BA Migration Plan

Status: DRAFT / EVIDENCE-DRIVEN. This document does not authorize third-party code reuse.

## Migration sequence
1. Evidence: inventory each source and record license/security/runtime boundaries.
2. Classification: assign each capability to Experience, Provider, Engine or Reference; a source may contribute to multiple categories.
3. Contract extraction: describe behavior as 4BA-owned interfaces before implementation.
4. License decision: reuse only when terms and provenance permit; otherwise clean-room reimplement the documented behavior.
5. Security scrub: exclude secrets, ads/tracking, paid mandatory infrastructure and access-control/DRM/paywall bypass.
6. Prototype behind contracts: never wire production UI directly to a provider.
7. Tests: contract tests, resolver failure tests, TV focus, RTL/languages, offline and platform compatibility.
8. Promote only after acceptance evidence.

## First-wave destinations
| Source | Provisional destination | Migration mode |
|---|---|---|
| Aniyomi | Provider SDK + Android architecture/reference | Contract study, then licensed reuse or clean-room |
| AIOStreams | Aggregation/Resolver reference | Behavioral extraction; backend remains optional |
| FlixQuest | Experience/Flutter/Cast reference | UX/component study; adapt to 4BA Design System |
| AIOMetadata | Metadata Engine reference | Schema/mapping study; preserve metadata/stream separation |
| Cinemax | Android Experience/reference | Architecture/UX study |
| CineSpot | Flutter Experience/reference | CLEAN_ROOM_BEHAVIOR only; direct reuse blocked by missing license/provenance; cloud/browser/WebView-first behavior excluded |
| Anthology | Provider health/testing reference | Per-addon provenance and contract study |
| Al-Qahtani | Arabic/sports/provider migration reference | Clean separation of UI/provider/player |
| Turkish-Series | Turkish data/update reference | Static-data/update strategy study |
| xoxixoxi + Ytvplus2 | Resolver/provider backend reference | Only zero-cost, lawful, isolated concepts |

## Non-negotiable target boundaries
Core owns domain/storage/config/security/localization/accessibility. Experience Engine owns presentation only. Provider SDK owns source capabilities. Metadata Engine owns identity/mapping/deduplication. Resolver owns ranking/fallback. Player owns playback state and native platform integration. Optional gateway may assist only when necessary and may never be a mandatory paid/video-proxy dependency.

## Evidence-gated migration modes
Every source contribution must use exactly one migration mode before implementation begins:

| Mode | Meaning | Allowed output |
|---|---|---|
| LICENSED_REUSE | Proven compatible license + provenance + dependency obligations | Reviewed code/assets with notices and tests |
| CLEAN_ROOM_BEHAVIOR | Behavior is useful but code reuse is blocked/unclear | 4BA-owned specification, tests and independent implementation |
| CONTRACT_REFERENCE | Architecture/API shape informs 4BA boundaries | ADR/contracts only; no implementation copy |
| EXPERIENCE_REFERENCE | UX interaction/layout concept is useful | Recreated 4BA Design-System behavior, not copied branding/assets |
| PROVIDER_PENDING | Provider concept understood but authorization incomplete | Disabled adapter specification/test fixtures only |
| QUARANTINE | Credential/access-control/security risk | No executable integration |
| EXCLUDED | Unrelated or constitution-incompatible | Audit record only |

### Current mandatory mappings
- aiometadata: `METADATA_ENGINE_REFERENCE + CLEAN_ROOM_BEHAVIOR`; audit complete, direct implementation reuse blocked by license conflict. Independently specify canonical normalization, ID mapping, bounded local caches/logs and transient-failure cache protection. External metadata APIs and credentials require separate admission; Redis/PostgreSQL/Docker/SOCKS/account tracking/metrics are not Core requirements.
- FlixQuest: `EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR`; audit complete, direct code/assets reuse blocked by GPL-3.0 for this migration. Independently specify adaptive navigation, player/offline/download/TV UX only. Reject ads/analytics, mandatory Firebase/cloud identity, scraper/proxy/relay runtime, proxy secrets/tokens, external-player/browser playback and broad inherited permissions.
- Aniyomi: `CONTRACT_REFERENCE + ANDROID_EXPERIENCE_REFERENCE`; Phase-1 audit complete with direct reuse deferred. Provider/source contracts, loader state, modular Android and benchmark concepts may inform independent 4BA implementation. Torrent/TorrServer, unauthorized extensions/providers, external-player/browser playback and primary WebView playback are excluded. Current upstream minSdk 26 does not change the provisional 4BA API 24 baseline.
- AIOStreams: `CLEAN_ROOM_BEHAVIOR` / `CONTRACT_REFERENCE`; Phase-1 audit complete fail-closed. Direct reuse remains blocked by the authoritative MIT/GPL conflict. Proxy/IP-bypass, torrent/Usenet/debrid, media relay, operator-auth/server-secret models and unauthorized provider runtime are excluded.
- AIOMetadata: `CLEAN_ROOM_BEHAVIOR` / `CONTRACT_REFERENCE`; direct reuse blocked while authoritative license conflict exists.
- FlixQuest: `EXPERIENCE_REFERENCE` + clean-room behavior only for current 4BA work; GPL implementation is not copied and ad/analytics integrations are excluded.
- orien.live: `QUARANTINE`.
- ProxyFill: `EXCLUDED` from runtime; Phase-1 evidence closure is complete as an evidence-backed exclusion after exact authoritative snapshot matching, no bundle-local LICENSE/NOTICE, and confirmed secret-handling defects.
- All provider-oriented bundle sources without explicit authorization evidence: `PROVIDER_PENDING`.
- Cinemax: `CONTRACT_REFERENCE` / `EXPERIENCE_REFERENCE` until dependency/API-key/telemetry obligations are fully closed.
- CineSpot: `EXPERIENCE_REFERENCE`; direct reuse blocked until license evidence is verified.
- Al-Qahtani: `CONTRACT_REFERENCE` for health/fallback concepts; direct-media relay/proxy behavior is `EXCLUDED`.
- Anthology: `CONTRACT_REFERENCE` + `PROVIDER_PENDING`; per-provider authorization and root-license evidence remain mandatory.
- cinemalist-official: `EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR` only; Phase-1 audit is complete. The authoritative GPLv3 snapshot is matched to the pinned public repository, so direct implementation/assets copying is not part of the current 4BA migration. The embedded default TMDB key is excluded and never recorded; production TMDB metadata use remains independently terms/authorization/attribution/key-management gated. YouTube trailer and external-URI launcher behavior are not promoted to the 4BA Player or Provider layer.
- cinextma: `EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR`; Phase-1 audit complete fail-closed with direct reuse deferred because authoritative license attribution remains unavailable. Mandatory Supabase/cloud/account coupling and Vercel analytics/telemetry are excluded from Core; no player/provider implementation is admitted.
- Filmex: `EXPERIENCE_REFERENCE` only; Phase-1 audit is complete. Direct code/assets reuse is blocked by missing root license. Mandatory Firebase/account/cloud coupling, Google Mobile Ads configuration and WebView/Google-Drive-preview playback are excluded; only clean-room UX ideas may inform 4BA Design System behind canonical contracts.
- CinemaPress: `CONTRACT_REFERENCE` only; Phase-1 audit is complete. Root MIT/provenance are verified, but mandatory CMS/backend, server-rendered Experience, ads/prebid, IP/WHOIS profiling, embedded/default credentials and server/embed/iframe/CinemaPlayer runtime are excluded.
- turkish-series: `CONTRACT_REFERENCE` + `PROVIDER_PENDING`; large mutable catalogs stay outside Core/app binaries.
- xoxixoxi: `CONTRACT_REFERENCE`; unapproved extraction runtime, bypass behavior and media relay are excluded.
- Ytvplus2: `CONTRACT_REFERENCE` + `PROVIDER_PENDING`.
- Live/sports family (Mstch_Server2, Match-Archive, getChanelFraom_dlstreams, YacinTv, SportFree, Cannels-arap-streem): `CONTRACT_REFERENCE` + `PROVIDER_PENDING`; EPG/public playlist reachability never proves stream authorization.
- Addon/provider family (ARB-S33-3, alooytv-addon, NuvioStreamsAddon, TRK_S, stremio-akwam.X, kiro-drama, kiro): `CONTRACT_REFERENCE` + `PROVIDER_PENDING`; addon compatibility or successful discovery is not authorization.

## Migration invariant
A source changing classification or migration mode requires an evidence update in the source card, acceptance ledger and relevant matrix in the same PR. No implementation PR may silently promote `PROVIDER_PENDING`, `QUARANTINE`, or `EXCLUDED` material.

- Al-Qahtani Phase-1: `CONTRACT_REFERENCE + EXPERIENCE_REFERENCE` only. Independently implement provider isolation, bounded health/fallback and strict validation behind canonical 4BA contracts. Do not migrate relay/proxy, IP telemetry, ads/tracking, external-browser or WebView-primary paths. Runtime providers require separate authorization.
