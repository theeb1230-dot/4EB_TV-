# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start/end `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec` (unchanged; PR #89 is not merged).
- PR #89: `provider/tvmaze-discovery`; start head `d3c47eea9ae999056e7cc52920c2ec23ee86ee03`.
- Exact-head runs for `d3c47ee...`: Audit hygiene succeeded; Core contracts failed only in `flutter-app-shell`. Architecture, native-player, local-data and TVmaze provider checks shown by GitHub were green. GitHub reports PR #89 mergeable=true.
- The legal navigation regression test was the only new app-shell-specific test introduced by #89. It constructed `FourBaAppShell` without the in-memory local-data backend used by the established app-shell tests, coupling a navigation assertion to persistent storage initialization. The test now injects `FlutterLocalDataRuntime(backend: MemoryPersistentStringBackend())`, isolating the legal navigation assertion from storage and matching the deterministic app-shell test harness.
- Functional fix commit: `aaec2d87df97757bcac9153b9b39f5cfcfae210b`. This state update advances the branch head again; re-read exact head and exact-head CI before merge.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Run decision and acceptance
### P0 selected: close PR #89 production discovery
Acceptance criteria:
1. Default executable registry has a lawful, zero-secret metadata discovery source.
2. Provider remains behind `ProviderRegistry` / `ContentDiscoveryProvider`; presentation remains provider-blind.
3. Provider advertises metadata/catalog/search only and fails closed for stream/download resolution.
4. Search/details/episodes mapping has deterministic tests.
5. Architecture policy admits the adapter boundary and CI runs its tests.
6. TVmaze CC BY-SA obligations are recorded and exposed through a reachable in-product legal/about surface.
7. PR exact head is CI green and mergeable before merge.

Closed/evidenced in PR #89:
- TVmaze adapter implements search/details/episodes and intentionally returns no playback/download source.
- Default app registry registers it without credentials or paid backend.
- Architecture policy and Core-contract matrix include `tvmaze_provider`.
- `docs/legal/TVMAZE_ATTRIBUTION.md` plus reachable `حول وحقوق البيانات` UI expose attribution/share-alike evidence with widget/navigation coverage.
- Branch is synchronized with current `main`; PR is mergeable.
- Exact-head CI isolates the remaining failure to the app-shell job; provider, architecture, native-player and local-data evidence is green.

Open acceptance:
- Exact-head Audit hygiene + Core contracts must be green on the current PR head after deterministic local-data injection in the legal navigation test. No blind rerun and no merge without this evidence.

## Blockers
### P0
1. PR #89 exact-head CI after `aaec2d87...` plus this state update; merge only when exact-head green and mergeable.
2. After merge, prove an authorized Search -> Details -> Episodes -> Resolve -> Native Play path. TVmaze remains metadata-only.
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
| Provider SDK/config | 6 | 55% | 3.3 |
| Metadata | 5 | 55% | 2.8 |
| Search/Resolver | 6 | 55% | 3.3 |
| Native Player | 10 | 40% | 4.0 |
| Experience + content UI | 8 | 45% | 3.6 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 15% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 55% | 1.7 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 48.3%**.
- **Current Phase Completion: 91%**.
- **Verified Functional Completion: 40%**.
- **Beta Readiness: 52%**; this is not a Beta usable claim.
- Percentages remain unchanged because `main` did not change.

## What does not work / is not proven
- PR #89 is not yet exact-head green after the deterministic app-shell test-harness fix.
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- No same-SHA four-platform Beta artifact/device matrix is proven.

## Next targets
1. Re-read PR #89 exact head and exact-head Actions. If Audit hygiene and Core contracts are green and mergeable, merge with expected-head protection.
2. Re-read `main` after merge and recalculate all four percentages from repository evidence.
3. Move immediately to the highest executable prerequisite for authorized Resolve -> Native Play; never invent or bypass a playback source.
4. Continue native-player and local product-loop blockers while no authorized playback source can legally be integrated.
