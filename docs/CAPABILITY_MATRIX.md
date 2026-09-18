# 4BA Capability Matrix

Status: Phase 1 evidence matrix. A signal means audited source evidence exists; it never grants reuse or provider authorization.

| Capability | 4BA owner | Strong source evidence | Required 4BA boundary | Gate |
|---|---|---|---|---|
| Canonical domain models | Core | Aniyomi, Cinemax, CineSpot | Provider-free canonical IDs/content/episodes | License/schema audit |
| Provider contracts | Provider SDK | Aniyomi, Anthology, Al-Qahtani | Capability-declared adapters; fail closed | Authorization + license |
| Metadata normalization/dedup | Metadata Engine | AIOMetadata, Aniyomi | Metadata independent of streams/providers | License + mapping tests |
| Search/catalog | Core + Metadata | CineSpot, Cinemax, Aniyomi, addon family | Unified canonical results; source IDs internal | API/auth evidence |
| Stream aggregation | Resolver | AIOStreams, Al-Qahtani, provider family | normalize -> dedup -> health -> rank -> fallback | Clean-room + authorization |
| Health/fallback | Resolver | Al-Qahtani, AIOStreams | local anonymous observations; deterministic failure isolation | Privacy + behavior tests |
| Native playback | Player | Aniyomi/FlixQuest signals | HLS/DASH/MP4 candidates, no provider-specific UI | platform/player audit |
| Resume/source switch | Player + Resolver | FlixQuest tests + 4BA fallback contracts | checkpoint preserved across candidate retry | integration tests |
| Subtitle/audio tracks | Player | Aniyomi Video model, FlixQuest tests | explicit normalized track descriptors | platform tests |
| Trusted intro/outro | Player | FlixQuest policy tests, Aniyomi chapter model | trusted timing distinguished from heuristic | provenance/timing tests |
| Download | Offline | FlixQuest offline lifecycle | capability separate from Stream; explicit user action | authorization/storage audit |
| Cast | Player | FlixQuest cast receiver signal | optional platform capability, phone remote where supported | protocol/platform audit |
| Live channels | Live Engine | live-source family | LiveMetadataProvider separate from LiveStreamProvider | authorization/license |
| EPG/match schedule | Live Metadata | sports/live family | metadata capability, never proof of stream rights | data-rights/freshness |
| Experience switching | Experience Engine | Cinemax/CineSpot/FlixQuest/cinemalist/cinextma references | presentation only; canonical user state persists | Design/accessibility audit |
| Android TV focus | Experience Engine | FlixQuest/Android candidates require deeper evidence | true 10-foot D-pad focus contracts | focus tests |
| Localization | Core | Aniyomi i18n + CineSpot localization signal | Arabic RTL default + English + Turkish | locale/RTL tests |
| Offline library/cache | Storage | Aniyomi local source, FlixQuest offline, Cinemax Room | local-first metadata/art/poster/progress cache | storage/privacy audit |
| Remote configuration | Config | third-party config signals only | optional signed fail-closed config; no home-grown crypto | crypto/key lifecycle audit |
| Diagnostics | Core/Quality | test/logging signals across sources | local/anonymous/opt-in only, no PII | privacy audit |
| Performance | Quality | Cinemax baseline profiles, Aniyomi macrobenchmark | platform benchmarks + Web load gates | benchmark implementation |

## Capability invariants
1. **Stream != Download.** A stream-capable provider has no download capability unless separately authorized and declared.
2. **Metadata != Stream.** Metadata identity, EPG and schedules cannot carry playback authority.
3. **Experience != Provider.** Switching UI cannot alter provider authorization or canonical user state.
4. **Health != Telemetry service.** Health scoring works locally; remote diagnostics are optional and anonymous only.
5. **Backend != Video path.** Optional gateways may assist metadata/config when necessary but never relay/proxy 4BA video.
6. **WebView != primary player.** Internal WebView is final fallback only; external browser playback is prohibited.
7. **Repository evidence != authorization.** Public code/URLs/addons do not automatically become executable providers.

## Phase-1 implementation gate
No capability sourced from a third-party project moves into implementation until its migration mode and acceptance-ledger evidence permit it. 4BA-owned contracts already merged remain the normative boundary and may evolve only through reviewed ADR/contract changes.
