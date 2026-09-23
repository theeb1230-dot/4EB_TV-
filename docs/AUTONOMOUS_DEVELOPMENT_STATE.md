# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `0523d3d1a53f51564eb52e38c19a1748f28f8eb8`.
- PR #99: `Presentation: expose History and Continue Watching surface contract`.
- Exact PR head before merge: `d6eb9bf23df8de8368c16b2bb0056fe976c3c340`.
- Exact-head CI for PR #99: Audit hygiene run `412` = success; Core contracts run `273` = success.
- Verified job families for PR #99: `architecture`, `flutter-app-shell`, `flutter-local-data`, `flutter-native-player`, `flutter-presentation`, `presentation_contract`, `experience_contract`, `provider_sdk`, `resolver_engine`, `capability_kernel`, `tvmaze_provider`, `local_data_codec`, `local_data_memory`, `local_data_persistent`, `playback_orchestrator`, `core_domain`, `design_tokens`, `metadata_engine`, and `app_flow` all passed.
- Merge result: PR #99 merged with exact merge SHA `8e38c56ef42ad7f9f86b9c6a4917502610e51f23`.
- Governance refresh branch: `governance/refresh-main-truth`.
- Exact governance branch head before this correction: `ccdc0b398fd50f4b426698f998912d9128e79102`.
- Open PR at this run start: #100, the only active change.
- Exact-head workflow evidence for #100 branch head: Audit hygiene run `415` = success; no Core contracts run was observed; combined commit status had no checks.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Re-read repository metadata, exact `main`, open PRs, branches, exact PR head, workflow runs, jobs, and status checks.
- Confirmed `main` is `0523d3d1a53f51564eb52e38c19a1748f28f8eb8`.
- Confirmed the previous state file was stale and incorrectly reported `8e38c56ef42ad7f9f86b9c6a4917502610e51f23` as current `main`.
- Corrected the state file on the dedicated governance branch without changing product behavior.

## Open acceptance / blockers
### P0
1. No authorized production playback path is proven.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Complete History + Continue Watching UI/runtime lifecycle around the merged presentation surface contract.
4. Complete Native Player runtime evidence for buffering/error/retry, quality, audio/subtitles, local SRT/VTT, next/countdown, PiP, and Cast/AirPlay where supported.
5. Produce and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
6. Complete exact-head CI for PR #100 and merge only after all required checks are green and the PR is mergeable.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These are merged-evidence figures only. There is still no authorized playback path, no complete Search-to-Native-Play E2E proof, and no same-SHA platform artifact/device evidence; therefore Beta usable, Golden, and Production are not claimed.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Verify whether a Core contracts workflow can be produced for the PR #100 head; do not merge on Audit hygiene alone.
2. After merge, wire the merged `WatchProgressSurfaceReader` into real History and Continue Watching UI/runtime with integration evidence.
3. Continue lawful playback-path audit without inventing a provider or converting TVmaze into a stream provider.
4. Add Native Player lifecycle coverage for buffering/error/retry and next/countdown.
5. Build and inspect same-SHA platform artifacts and provenance.
6. Recompute the four percentages from the next verified merged evidence only.
