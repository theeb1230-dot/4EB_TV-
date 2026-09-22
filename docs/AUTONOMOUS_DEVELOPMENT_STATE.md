# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec`.
- PR #89 exact head: `c83c4cabaf971bf8c2863a4d39768eec6b8428af`.
- Exact-head CI for PR #89: `Audit hygiene` success and `Core contracts` success.
- PR #89 was mergeable and was merged with expected-head protection.
- Exact post-merge `main`: `4789b90d9f7068ec58c3d0a0d045583b6c9d1064`.
- TVmaze is production discovery/metadata only. It advertises no playback/download capability and remains separated from stream resolution.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance: P0 production discovery
1. Default executable registry has a lawful, zero-secret metadata discovery source.
2. Provider remains behind `ProviderRegistry` / `ContentDiscoveryProvider`; presentation remains provider-blind.
3. TVmaze advertises metadata/catalog/search only and fails closed for stream/download resolution.
4. Search/details/episodes mapping has deterministic tests.
5. Architecture policy admits the adapter boundary and CI runs its tests.
6. TVmaze CC BY-SA obligations are recorded and exposed through a reachable in-product legal/about surface.
7. PR exact head was CI green and mergeable before protected merge.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, scrape around access controls, relay media, or turn TVmaze into playback. Integrate only a lawful authorized source behind `ProviderRegistry` / Resolver when one is actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete native player HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, buffering/error/retry, resume, same-position source switching, next/countdown, PiP and platform-supported Cast/AirPlay.
4. Complete local Favorites + History + Continue Watching.
5. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine Preview/Apply; local profile/recommendations/feedback/Incognito/Collections/backup and optional Zero-PII sync.

### P2
Stable/Beta update discovery, Developer Mode, privacy-safe diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
| Product area | Weight | Verified item completion | Weighted points |
|---|---:|---:|---:|
| Governance + 30-source audit | 10 | 78% | 7.8 |
| Architecture/workspace | 7 | 80% | 5.6 |
| Design System | 6 | 78% | 4.7 |
| Core | 10 | 55% | 5.5 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 40% | 4.0 |
| Experience + content UI | 8 | 47% | 3.8 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 15% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 58% | 1.7 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 49.2%**.
- **Current Phase Completion: 100%** for the production-discovery slice just closed. The next P0 phase is authorized playback/E2E proof and starts incomplete.
- **Verified Functional Completion: 42%**.
- **Beta Readiness: 54%**; this is not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts are still absent.
- Increase is limited to merged, exact-head-green production discovery, legal attribution reachability, and deterministic provider integration evidence. Playback receives no credit from TVmaze.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Player advanced controls/platform evidence remain incomplete.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Audit current provider candidates and configuration for an actually authorized production playback integration. If none exists, explicitly keep this blocker open and move to independent native-player/local-loop prerequisites rather than fabricating a source.
2. Prove authorized Resolve -> Native Play end to end when a lawful source is available.
3. Continue native-player and local Favorites/History/Continue Watching blockers independently.
4. Build and inspect same-SHA platform artifacts only after the runtime path is sufficiently complete for meaningful Beta smoke.
