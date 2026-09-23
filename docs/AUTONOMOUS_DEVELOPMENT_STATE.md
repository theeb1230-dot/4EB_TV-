# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact start `main`: `53e0b0935fc2db020601476e94484660929340d7`
- PR #99: `Presentation: expose History and Continue Watching surface contract`
- Exact PR head before merge: `d6eb9bf23df8de8368c16b2bb0056fe976c3c340`
- Exact-head CI: Audit hygiene run `412` = success; Core contracts run `273` = success.
- Verified job families: `architecture`, `flutter-app-shell`, `flutter-local-data`, `flutter-native-player`, `flutter-presentation`, `presentation_contract`, `experience_contract`, `provider_sdk`, `resolver_engine`, `capability_kernel`, `tvmaze_provider`, `local_data_codec`, `local_data_memory`, `local_data_persistent`, `playback_orchestrator`, `core_domain`, `design_tokens`, `metadata_engine`, and `app_flow` all passed.
- Merge result: PR #99 merged with exact merge SHA `8e38c56ef42ad7f9f86b9c6a4917502610e51f23`.
- Exact current `main` after merge: `8e38c56ef42ad7f9f86b9c6a4917502610e51f23`.
- Open PRs after merge: none verified in the repository search.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Re-read repository metadata, open PRs, exact PR head, exact-head workflow runs, jobs, and job steps.
- Confirmed exact-head CI green for PR #99.
- Merged PR #99 with expected-head protection.
- Merged presentation surface projection and reader contract for History/Continue Watching.
- Preserved the presentation/domain boundary and Zero-PII/local-first invariants.

## Open acceptance / blockers
### P0
1. No authorized production playback path is proven.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Complete History + Continue Watching UI/runtime lifecycle around the merged presentation surface contract.
4. Complete Native Player runtime evidence for buffering/error/retry, quality, audio/subtitles, local SRT/VTT, next/countdown, PiP, and Cast/AirPlay where supported.
5. Produce and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
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
1. Wire the merged `WatchProgressSurfaceReader` into real History and Continue Watching UI/runtime with integration evidence.
2. Continue lawful playback-path audit without inventing a provider or converting TVmaze into a stream provider.
3. Add Native Player lifecycle coverage for buffering/error/retry and next/countdown.
4. Build and inspect same-SHA platform artifacts and provenance.
5. Recompute the four percentages from the next verified merged evidence only.
