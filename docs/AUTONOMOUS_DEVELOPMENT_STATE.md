# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `815d428205d045003b3a097aa5d48b34b8be854e`.
- Open PR: #98 `Player: wire runtime history and continue watching persistence`.
- Initial PR head inspected: `0e03e745e66ed84c6306177b5e95b1dca3e53050`.
- Exact-head `Audit hygiene` run 402 = success.
- Exact-head `Core contracts` run 265 = failure in `flutter-native-player` during `flutter analyze`.
- Failure evidence: unused import of `playback_orchestrator` and a non-const `WatchProgress` constructor used with `const` in `test/watch_progress_runtime_test.dart`; formatter was already clean and all other completed jobs/architecture checks passed.
- Same-branch repair commit: `57411f8fc1afacfe5586dc14064decccb14ea189`.
- Repair changed only the failing test: removed the unused import and removed the invalid `const` constructor invocation without changing product behavior.
- Current PR #98 head after repair: `57411f8fc1afacfe5586dc14064decccb14ea189`.
- Exact-head workflows for the repaired head were not yet visible at the end of this run; PR remains open and not merged.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. PR #98 runtime wiring changes were inspected against the actual diff and logs.
2. The native player analyzer failure was fixed on the same PR branch without changing product behavior.
3. The repaired test preserves local-only watch metadata and provider/UI separation.

## Open acceptance
1. Exact-head CI for `57411f8...` must be green.
2. PR #98 must be mergeable and then merged with expected-head protection.
3. Wire the merged History + Continue Watching contract into runtime/UI lifecycle with integration evidence.
4. Prove authorized Search -> Details -> Episodes -> Resolve -> Native Play with provider-local provenance and canonical metadata/stream separation.
5. Complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
6. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

## Blockers
### P0
1. No authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provenance and metadata/stream separation.
3. Complete local History + Continue Watching UI lifecycle around the merged resume runtime and WatchProgress contract.
4. Complete buffering/error lifecycle and advanced player/platform evidence.
5. Produce and inspect same-SHA platform artifacts and device smoke evidence.

### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine Preview/Apply; local profile/recommendations/feedback/Incognito/Collections/backup and optional Zero-PII sync.

### P2
Stable/Beta update discovery, Developer Mode, privacy-safe diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
| Product area | Weight | Verified item completion | Weighted points |
|---|---:|---:|---:|
| Governance + 30-source audit | 10 | 78% | 7.8 |
| Architecture/workspace | 7 | 82% | 5.7 |
| Design System | 6 | 78% | 4.7 |
| Core | 10 | 62% | 6.2 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 58% | 5.8 |
| Experience + content UI | 8 | 49% | 3.9 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 20% | 0.6 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 66% | 2.0 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 51.4%** from merged evidence only.
- **Current Phase Completion: 36%**.
- **Verified Functional Completion: 51%**.
- **Beta Readiness: 61%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; branch-only work earns no merged/verified credit.

## What changed in this run
- Re-read current main, PR state, exact-head workflow jobs, and failure logs.
- Found an analyzer-only failure in `flutter-native-player` for PR #98.
- Fixed the unused import and invalid `const` constructor invocation on the same branch in commit `57411f8...`.
- Updated this state document on the same branch; merge is intentionally pending until repaired-head CI is visible and green.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- History + Continue Watching UI lifecycle is not yet demonstrated end-to-end.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Beta/Golden/Production are not usable claims.

## Next targets
1. Verify exact-head CI for `57411f8...`.
2. Fix any new failure on PR #98 only; merge only after green and mergeable.
3. Re-read `main` after merge and refresh this document with the real merge SHA.
4. Continue runtime/UI integration and lawful playback-path audit.
