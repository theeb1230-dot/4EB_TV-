# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec`.
- Exact end `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec` (unchanged; PR #89 is not merged).
- PR #89 branch: `provider/tvmaze-discovery`.
- Start PR head: `d89df9cea333207e0e691000ddb9be6247487388`.
- Exact-head run `35670502035` executed for `d89df9cea333207e0e691000ddb9be6247487388`: Audit hygiene succeeded; Core contracts failed only in `flutter-app-shell` during `flutter test`. Formatting and `flutter analyze` in that job succeeded, while local-data, presentation, architecture, native-player and the provider/package matrix shown by the run were green.
- The likely app-shell regression was isolated to legal attribution assertions using `find.text(...)` against `SelectableText`. The legal surface now renders the two attribution URLs as ordinary `Text`, preserving visible attribution while making the existing widget/navigation assertions deterministic.
- Functional fix commit before this handoff update: `8afa6e7b9ad22aa8d3beeaac12ce5be92f51c1d1`.
- This documentation commit advances the branch head again; re-read the exact head and exact-head CI before any merge.
- PR #89 was `mergeable=true` before the functional fix; mergeability must be re-read for the new exact head.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Run decision and acceptance
### P0 selected: close PR #89 production discovery
Acceptance criteria:
1. Default executable registry has at least one lawful, zero-secret metadata discovery source.
2. Provider remains behind `ProviderRegistry` / `ContentDiscoveryProvider`; presentation remains provider-blind.
3. Provider advertises metadata/catalog/search only and fails closed for stream/download resolution.
4. Search, details and episodes mapping have deterministic tests.
5. Architecture policy admits the concrete adapter boundary and CI runs its tests.
6. TVmaze CC BY-SA attribution/share-alike obligations are recorded and exposed through a reachable in-product legal/about surface.
7. PR exact head is CI green and mergeable before merge.

Closed/evidenced in PR #89:
- TVmaze adapter implements search/details/episodes and intentionally returns no playback/download source.
- Default app registry registers it without credentials or paid backend.
- Architecture policy and Core-contract matrix include `tvmaze_provider`.
- `docs/legal/TVMAZE_ATTRIBUTION.md` records attribution/share-alike obligations.
- Reachable `حول وحقوق البيانات` UI exposes TVmaze and CC BY-SA evidence with widget/navigation coverage.
- Branch divergence from `main` was removed structurally by a two-parent synchronization commit; current `main` presentation files were preserved.
- Exact-head CI now runs after synchronization; the first synchronized exact-head run isolated a single app-shell widget-test failure rather than an analyze/compile or provider failure.

Open acceptance:
- Exact-head Audit hygiene + Core contracts must be green on the current PR head after the legal-surface testability fix. No blind rerun and no merge without this evidence.

## Blockers
### P0
1. PR #89 exact-head CI evidence after commit `8afa6e7b9ad22aa8d3beeaac12ce5be92f51c1d1` and this handoff update; merge only when exact-head green and mergeable.
2. After #89 merges, prove an authorized Search -> Details -> Episodes -> Resolve -> Native Play path. TVmaze remains metadata-only and cannot satisfy playback.
3. Complete native player HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, buffering/error/retry, resume, same-position source switching, next/countdown, PiP and platform-supported Cast/AirPlay with regression evidence.
4. Complete local Favorites + History + Continue Watching.
5. Produce same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, inspect artifacts, and collect platform/device smoke evidence.

### P1
- Downloads/offline queue, quality/audio/subtitles, season queue, quota/cleanup and cached library metadata.
- Authorized Live/Sports/EPG and mini-player.
- Experience Engine Preview/Apply while preserving local state.
- Single local profile, recommendations, feedback, Incognito, Collections, backup export/import and optional Zero-PII sync.

### P2
- Stable/Beta update discovery, Developer Mode, privacy-safe optional diagnostics, performance/accessibility hardening and Golden gates.

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

- **Overall Product Completion: 48.3%**. PR #89 remains excluded from merged production capability until exact-head CI is green and it reaches `main`.
- **Current Phase Completion: 91%** for Phase 3 Design System execution.
- **Verified Functional Completion: 40%** because runtime/platform evidence and authorized playback remain incomplete.
- **Beta Readiness: 52%**. This is not a Beta usable claim; authorized Resolve -> Native Play and same-SHA platform artifacts/smoke are still mandatory.
- Percentages remain unchanged because `main` did not change. This run converted the synchronized PR from an unknown CI gate into a concrete single app-shell widget-test defect and applied a targeted fix.

## What does not work / is not proven
- PR #89 is not yet exact-head green after the targeted app-shell test fix.
- No authorized production playback provider/path is proven.
- No end-to-end authorized Search -> Details -> Episodes -> Resolve -> Native Play evidence exists yet.
- No same-SHA four-platform Beta artifact/device matrix is proven.

## Next targets
1. Re-read PR #89 exact head after this docs commit and inspect exact-head Actions/checks/logs. If Core contracts and Audit hygiene are green and the PR is mergeable, merge using expected-head protection.
2. Re-read `main` after merge and recalculate all four percentages from repository evidence.
3. Move immediately to the highest executable prerequisite for authorized Resolve -> Native Play; do not invent or bypass a playback source.
4. Continue native-player and local product-loop blockers while no authorized playback source can legally be integrated.
