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
| CineSpot | Flutter Experience/reference | Discovery/search/watchlist study |
| Anthology | Provider health/testing reference | Per-addon provenance and contract study |
| Al-Qahtani | Arabic/sports/provider migration reference | Clean separation of UI/provider/player |
| Turkish-Series | Turkish data/update reference | Static-data/update strategy study |
| xoxixoxi + Ytvplus2 | Resolver/provider backend reference | Only zero-cost, lawful, isolated concepts |

## Non-negotiable target boundaries
Core owns domain/storage/config/security/localization/accessibility. Experience Engine owns presentation only. Provider SDK owns source capabilities. Metadata Engine owns identity/mapping/deduplication. Resolver owns ranking/fallback. Player owns playback state and native platform integration. Optional gateway may assist only when necessary and may never be a mandatory paid/video-proxy dependency.
