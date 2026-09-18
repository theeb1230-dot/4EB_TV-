# 4BA Provider Matrix

Status: Phase 1 evidence matrix. A row is architectural classification, **not authorization to access or redistribute a source**.

| Source | Provider/engine signal | Candidate 4BA destination | Approval |
|---|---|---|---|
| Aniyomi | Verified source -> hoster -> video contract | Provider SDK contract/reference | Conditional; Apache snapshot, dependency/file audit pending |
| AIOStreams | Verified staged filter/sort/dedup pipeline | Resolver clean-room reference | Direct reuse blocked by bundled license conflict; restricted behaviors excluded |
| FlixQuest | Player/provider/offline consumer patterns | Experience/API-consumer reference | GPL reference only; ads/tracking excluded |
| AIOMetadata | Metadata network/cache/provider boundaries | Metadata Engine clean-room reference | Direct reuse blocked by license conflict |
| Anthology | Addon/catalog/provider/playability test ecosystem | Provider SDK/addon reference | Each provider requires separate authorization review |
| Al-Qahtani | Provider registry/probe/fallback runtime | Provider health/fallback reference | Concepts only; video relay/proxy excluded |
| turkish-series | Large Turkish catalog + Android/Python data tooling | Turkish metadata/provider reference | License/data redistribution/freshness pending |
| xoxixoxi | Backend/browser/media tooling | Provider/health reference | No mandatory scraper backend; authorization pending |
| Ytvplus2 | Multi-source backend/provider signal | Provider adapters + Resolver | Authorization/network audit pending |
| Mstch_Server2 | Sports backend/provider signal | Sports provider reference | Authorization/license pending |
| Match-Archive | Match archive provider signal | Sports metadata reference | Authorization/license pending |
| getChanelFraom_dlstreams | Live-channel data/provider signal | LiveStreamProvider reference | Authorization/license pending |
| YacinTv | Live-channel source signal | LiveStreamProvider reference | Authorization/license pending |
| SportFree | Sports provider/backend signal | Sports provider reference | Authorization/license pending |
| Cannels-arap-streem | Arabic channel data signal | Live metadata/provider reference | Authorization/license pending |
| orien.live | Credential-discovery risk signal | **Quarantine/reference only** | REJECTED as implementation source |
| ARB-S33-3 | Node/Stremio provider signal | Provider SDK contract reference | PROVIDER_PENDING; source/content authorization + license pending |
| alooytv-addon | Node/Stremio provider signal | Provider SDK contract reference | PROVIDER_PENDING; source/content authorization + license pending |
| NuvioStreamsAddon | Addon aggregation/provider signal | Provider SDK + Resolver contract reference | PROVIDER_PENDING; authorization/config/network evidence pending |
| TRK_S | Turkish Stremio provider signal | Turkish Provider SDK reference | PROVIDER_PENDING; authorization/license pending |
| stremio-akwam.X | Python/FastAPI Stremio-style provider signal | Provider SDK/Resolver contract reference | PROVIDER_PENDING; authorization/license/network evidence pending |
| kiro-drama | Small JS/JSON provider signal | Provider SDK contract reference | PROVIDER_PENDING; authorization/license pending |
| kiro | Small provider/reference signal | Provider SDK contract reference | PROVIDER_PENDING; authorization/license pending |

## Admission-state semantics

- **REFERENCE_ONLY:** architecture/behavior may inform clean-room contracts; runtime access is not approved.
- **QUARANTINED:** evidence exposes a security, credential, bypass or provenance concern; no implementation/runtime use.
- **PENDING_AUTHORIZATION / PROVIDER_PENDING:** technical capability is known but source/content authority is unresolved.
- **PENDING_LICENSE:** authorization may be possible, but code/data reuse terms remain unresolved.
- **ELIGIBLE_DISABLED:** evidence gates are closed but provider remains disabled until an explicit product/config decision.
- **ENABLED:** explicit evidence-backed production admission only.
- **REVOKED:** previously admitted provider is fail-closed without deleting canonical favorites/history/progress.

Public repositories, reachable URLs, addon compatibility, successful playability and permissive package metadata do not skip these states.

## Provider admission gate
A production provider must declare capabilities, remain replaceable, expose no secret to UI, support health/error classification, avoid mandatory paid infrastructure, avoid ads/tracking, and contain no DRM/paywall/access-control bypass. Source access and redistribution must be authorized. Watch and Download capabilities are represented separately.

## Live/Sports boundary
EPG/match/channel metadata and playback resolution are independent capabilities. The Experience layer consumes normalized 4BA models only. Provider-specific JSON, credentials and endpoint details never cross into UI contracts.
