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

## Provider admission gate
A production provider must declare capabilities, remain replaceable, expose no secret to UI, support health/error classification, avoid mandatory paid infrastructure, avoid ads/tracking, and contain no DRM/paywall/access-control bypass. Source access and redistribution must be authorized. Watch and Download capabilities are represented separately.

## Live/Sports boundary
EPG/match/channel metadata and playback resolution are independent capabilities. The Experience layer consumes normalized 4BA models only. Provider-specific JSON, credentials and endpoint details never cross into UI contracts.
