# 4BA Experience Matrix

Status: Phase 1 evidence matrix. Experience candidacy is not direct-code reuse approval.

| Source | Experience candidacy | Evidence | Decision |
|---|---|---|---|
| 4BA Cinematic Gold | Official/default | Locked Product Constitution + Design System | APPROVED direction |
| FlixQuest | High | Flutter UI/player/offline/Cast evidence | Clean-room Experience reference; GPL + ads/tracking exclusions |
| Cinemax | High for Android/TV patterns | Modular Compose + dark design system + baseline profiles | Experience/Reference; deeper dependency audit pending |
| CineSpot | High for Flutter discovery | Flutter/BLoC/localization + Firebase account coupling | Experience reference; local-first 4BA rules override cloud coupling |
| cinemalist | Medium/High | Flutter/TMDB/BLoC inventory | Candidate pending file-level license/network audit |
| cinextma | Medium/High for Web | Next.js responsive web + Supabase signal | Web Experience reference; no mandatory cloud backend |
| Filmex | Medium | Compact Flutter UI inventory | Candidate pending deep audit |
| Aniyomi | Medium/reference-heavy | Android presentation/source/player architecture | Architecture/reference; not automatically a selectable Experience |
| Al-Qahtani | Medium | Flutter/web clean-room migration surfaces | Reference/Experience concepts; legacy bridges/proxy excluded |
| AIOStreams | Low as UI | TypeScript aggregation workspace | Engine/Resolver reference, not Experience |
| AIOMetadata | Low as UI | Metadata/configure frontend/backend | Metadata Engine reference, not Experience |
| CinemaPress | Low | Node/EJS CMS | Reference/Engine, not client Experience |
| ProxyFill | None | Unrelated Blazor printing utility | EXCLUDED from 4BA runtime |

## Experience admission gate
A selectable Experience must provide a distinctive maintainable UX while preserving the same 4BA Core state: favorites, history, progress, downloads and settings. It must support Arabic RTL, English and Turkish, accessibility, TV focus where applicable, ZERO_ADS and Zero-PII. Experiences may override approved accent/layout tokens but cannot bypass player safety, provider boundaries or accessibility contracts.

Projects that are primarily providers, scrapers, metadata engines, CMSs or unrelated tools are deliberately **not** forced into the Experience selector.
