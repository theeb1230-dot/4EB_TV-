# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `885cf054e472897bbec491b7c6b2bda119ed709c`.
- Open PRs at run start: PR #101 only.
- Working branch: `presentation/watch-progress-collections`.
- Product change commit: `1ffd7dc5de6882090ea23579d9f53f3811bda25c`.
- CI repair commit: `c187f16975da381b45a10e0fe788a7280749f7aa`.
- Current branch head before this state refresh: `c187f16975da381b45a10e0fe788a7280749f7aa`.
- State refresh commit: recorded by this file update.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Re-read repository metadata, exact `main`, open PRs, exact PR head, workflow runs, jobs, and status evidence.
- Added a deterministic presentation collection for History and Continue Watching.
- Kept completed items in History and excluded them from Continue Watching.
- Kept sorting newest-first by `updatedAt`.
- Added tests for ordering, completion filtering, and defensive snapshots.
- Exported the new contract through `presentation_contract`.
- Fixed the observed `presentation_contract` formatting failure on the same PR branch.
- Confirmed the repaired head started fresh CI; Audit hygiene passed, while Core contracts failed in `flutter-app-shell` during `flutter test`.

## Acceptance evidence
- Code and tests are committed on the working branch.
- Exact-head CI for `361311a53a72b35469b7623e59772b8462c6f1e9` produced Audit hygiene run `422` = success and Core contracts run `277` = failure.
- Completed green jobs in Core contracts included architecture, flutter-local-data, and flutter-native-player; `flutter-app-shell` failed in its `flutter test` step. This is the next concrete blocker; no claim is made about the failure's root cause without the job log output.
- No runtime/platform E2E evidence is claimed by this change.

## Open acceptance / blockers
### P0
1. Fix the observed `flutter-app-shell` test failure on PR #101 only, using the actual job log rather than an unrelated or blind rerun.
2. No authorized production playback path is proven.
3. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
4. Complete History + Continue Watching UI/runtime lifecycle around the merged presentation surface contract and this collection policy.
5. Complete Native Player runtime evidence for buffering/error/retry, quality, audio/subtitles, local SRT/VTT, next/countdown, PiP, and Cast/AirPlay where supported.
6. Produce and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain merged-evidence figures only. This branch does not change them until the PR is verified and merged.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Obtain and read the `flutter-app-shell` job log for run `277`; do not rerun blindly.
2. Fix only the observed root cause on PR #101.
3. Verify a fresh exact-head run is fully green and `mergeable=true`.
4. Merge only after green required checks, then re-read `main` and refresh this file with the exact merge SHA.
5. Wire the collection into real History and Continue Watching UI/runtime with integration evidence.
6. Continue lawful playback-path audit without inventing a provider or converting TVmaze into a stream provider.
7. Add Native Player lifecycle coverage for buffering/error/retry and next/countdown.
8. Build and inspect same-SHA platform artifacts and provenance.
9. Recompute the four percentages from the next verified merged evidence only.
