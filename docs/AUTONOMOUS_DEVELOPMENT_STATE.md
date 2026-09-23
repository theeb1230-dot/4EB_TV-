# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `815d428205d045003b3a097aa5d48b34b8be854e`.
- PR #98 was the only open PR at start: `Player: wire runtime history and continue watching persistence`.
- PR #98 initial inspected head: `e0785fd8523e5963a5dc1a23bc6f7052e45f5178`.
- Same-branch repair head before merge: `e773e9f470d81d626e5987acac5ab072e4639343`.
- Exact-head `Audit hygiene` run 404 = success.
- Exact-head `Core contracts` run 267 = success.
- Core contracts job matrix completed successfully, including `flutter-native-player`, `flutter-local-data`, `flutter-presentation`, `flutter-app-shell`, `architecture`, `core_domain`, `resolver_engine`, `playback_orchestrator`, `experience_contract`, `metadata_engine`, `tvmaze_provider`, and persistence packages.
- PR #98 merged with expected-head protection.
- Merge commit: `3d5d0fc16ac5fcce3701c4851a5c4b614c9dd8bf`.
- Exact current `main` after merge: `3d5d0fc16ac5fcce3701c4851a5c4b614c9dd8bf`.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. PR #98 exact-head CI is green.
2. Runtime resume/history wiring is merged into `main`.
3. Local-only watch metadata and provider/UI separation remain intact.
4. Merge used expected-head protection.

## Open acceptance
1. Wire the merged History + Continue Watching contract into runtime/UI lifecycle with integration evidence.
2. Prove authorized Search -> Details -> Episodes -> Resolve -> Native Play with provider-local provenance and canonical metadata/stream separation.
3. Complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
4. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

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
| Core | 10 | 64% | 6.4 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 61% | 6.1 |
| Experience + content UI | 8 | 49% | 3.9 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 20% | 0.6 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 69% | 2.1 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 52.1%** from merged evidence only.
- **Current Phase Completion: 39%**.
- **Verified Functional Completion: 54%**.
- **Beta Readiness: 63%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; branch-only work earns no merged/verified credit.

## What changed in this run
- Re-read current main, PR state, exact-head workflow runs/jobs, and completed job results.
- Confirmed PR #98 repaired head `e773e9f...` passed the full exact-head CI matrix.
- Merged PR #98 with merge commit `3d5d0fc...`.
- Re-read and updated this document on `main` after the merge.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- History + Continue Watching UI lifecycle is not yet demonstrated end-to-end.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Beta/Golden/Production are not usable claims.

## Next targets
1. Integrate the merged WatchProgress contract with History and Continue Watching UI/runtime and add integration evidence.
2. Continue lawful playback-path audit; do not invent a provider.
3. Complete buffering/error and next/countdown player lifecycle.
4. Build and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts.
5. Recompute evidence-weighted percentages after the next merged unit.
