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


## Capability ownership and invariants

| Capability | Canonical owner | Provider-facing contract | Experience exposure | Non-negotiable invariant |
|---|---|---|---|---|
| Catalog/Search | Core + Search Engine | Catalog/Search capability | Canonical result view models | Provider IDs/endpoints are hidden in normal UX |
| Metadata | Metadata Engine | Metadata capability | Canonical content/details | Metadata identity is independent from stream availability |
| Stream | Resolver + Player boundary | Stream capability | Play action + Advanced Sources | Stream never implies Download |
| Download | Offline Manager | Download capability | Explicit Download action | Separate authorization/capability and user choice |
| Subtitle | Player/Metadata boundary | Subtitle capability | Track picker + local SRT/VTT | Local file support does not grant remote source authority |
| Live | Live Engine | Live capability | Channel/now-next UI | EPG metadata is separate from stream authorization |
| EPG | Live Metadata Engine | EPG capability | Yesterday/today/+3 days | Schedule reachability never authorizes video |
| Health | Resolver | local observations only | Hidden normally; Developer Mode details | Zero-PII, local/optional anonymous diagnostics |
| Experience | Experience Engine | none | Preview/Apply | Presentation cannot mutate canonical user state |
| Sync | Optional Sync adapter | none | Opt-in account/device sync | Local mode remains fully functional |

### Watch / Download separation

A provider declaring `stream` is not eligible for `download` unless the Download capability is separately declared and authorization evidence permits it. Resolver ranking for playback cannot silently produce a download candidate, and Offline Manager cannot reinterpret a playback URL as downloadable media.

### Metadata / Stream separation

Canonical content identity, titles, artwork, seasons, episodes and user state survive provider outages and provider revocation. Stream candidates are ephemeral capability results attached to a canonical content request; they are never the primary identity key for favorites, history, progress or collections.

### Live / EPG separation

Live channel identity and schedule metadata are normalized independently from playable stream candidates. A channel may retain EPG and cached metadata while every stream provider is unavailable or revoked. Provider health affects stream selection, not canonical schedule history.

### Advanced Sources boundary

Normal UX exposes quality/availability rather than provider branding. Developer Mode or Advanced Sources may expose evidence-safe provider labels and health diagnostics, but never credentials, private headers, tokens, raw secret-bearing URLs or captured cookies.
