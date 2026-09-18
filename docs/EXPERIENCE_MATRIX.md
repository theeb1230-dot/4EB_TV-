# 4BA Experience Matrix

Status: Phase 1 evidence matrix. Experience candidacy is not direct-code reuse approval.

| Source | Experience candidacy | Evidence | Decision |
|---|---|---|---|
| 4BA Cinematic Gold | Official/default | Locked Product Constitution + Design System | APPROVED direction |
| FlixQuest | High | Flutter UI/player/offline/Cast evidence | Clean-room Experience reference; GPL + ads/tracking exclusions |
| Cinemax | High for Android/TV patterns | Modular Compose + dark design system + baseline profiles | Experience/Reference; deeper dependency audit pending |
| CineSpot | High for Flutter discovery reference | Flutter/BLoC/localization + Firebase account coupling; no root license/provenance | EXPERIENCE_REFERENCE / CLEAN_ROOM only; direct code/assets blocked and cloud/browser/WebView-first behavior excluded |
| cinemalist | Medium/High reference only | Authoritative snapshot matched to public master; Flutter/BLoC discovery, TMDB client, saved/local JSON behavior; GPLv3; non-empty default TMDB key; YouTube trailer + external URI launcher | EXPERIENCE_REFERENCE + CLEAN_ROOM only; direct code/assets copy blocked; TMDB production use separately gated; no Player/Provider admission |
| cinextma | Medium/High Web reference | Authoritative Next.js/TypeScript/Supabase inventory + corroborating PWA evidence; archive license attribution unavailable | EXPERIENCE_REFERENCE / CLEAN_ROOM only; direct reuse deferred, no mandatory cloud/account/telemetry/provider behavior |
| Filmex | Medium reference only | Authoritative Flutter/Firebase/WebView audit complete; no root license; Google Mobile Ads configured; WebView/Drive playback; Firebase account/cloud coupling | EXPERIENCE_REFERENCE only; direct reuse blocked, ads/cloud/WebView-first player excluded |
| Aniyomi | Medium/reference-heavy | Android presentation/source/player architecture | Architecture/reference; not automatically a selectable Experience |
| Al-Qahtani | Medium | Flutter/web clean-room migration surfaces + fallback/bridge audit | CONTRACT_REFERENCE + EXPERIENCE_REFERENCE; legacy WebView bridge, relay/proxy, IP telemetry and inherited ads/tracking excluded |
| AIOStreams | Low as UI | TypeScript aggregation workspace | Engine/Resolver reference, not Experience |
| AIOMetadata | Low as UI | Metadata/configure frontend/backend | Metadata Engine reference, not Experience |
| CinemaPress | Low | Node/EJS CMS | Reference/Engine, not client Experience |
| ProxyFill | None | Unrelated Blazor printing utility | EXCLUDED from 4BA runtime |

## Experience admission gate
A selectable Experience must provide a distinctive maintainable UX while preserving the same 4BA Core state: favorites, history, progress, downloads and settings. It must support Arabic RTL, English and Turkish, accessibility, TV focus where applicable, ZERO_ADS and Zero-PII. Experiences may override approved accent/layout tokens but cannot bypass player safety, provider boundaries or accessibility contracts.

Projects that are primarily providers, scrapers, metadata engines, CMSs or unrelated tools are deliberately **not** forced into the Experience selector.

## Experience isolation contract
1. An Experience receives canonical 4BA view models and capability availability only; it never imports provider-specific response models, credentials or endpoint logic.
2. Preview is side-effect free. Apply changes presentation state only and cannot mutate favorites, history, progress, downloads, provider authorization or account/local-mode state.
3. 4BA Cinematic Gold remains the default and owns the official champagne-gold identity. Alternate Experiences may vary approved accent/layout tokens but cannot impersonate the official identity.
4. Every selectable Experience must pass Arabic RTL, English, Turkish, text scaling, screen-reader semantics, reduced motion and applicable TV D-pad/focus gates before admission.
5. Phone, tablet/foldable, TV and Web layouts may differ substantially while sharing canonical state. Android TV is a 10-foot Experience, not an enlarged phone tree.
6. Experience code cannot open an external browser for playback. Native playback remains primary and internal WebView remains final fallback only.
7. ZERO_ADS and Zero-PII are non-overridable. An inherited ad, analytics, crash-reporting or cloud-account dependency is removed or replaced before an Experience can become selectable.

## Admission states
- **EXPERIENCE_REFERENCE:** evidence may inform clean-room UX/contracts; not selectable.
- **CANDIDATE_DISABLED:** implementation exists behind Core contracts but acceptance gates are incomplete.
- **ELIGIBLE_DISABLED:** all required gates pass; explicit product decision still required.
- **ENABLED:** selectable Experience with migration/rollback coverage.
- **REVOKED:** disabled fail-closed without deleting canonical user state.
