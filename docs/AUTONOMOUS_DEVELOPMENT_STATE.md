# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `d76e1948b7418f6b1578581fc19ba6f2373d1e4c`.
- PR worked this run: `#103` (`Test: verify History and Continue Watching widget integration`).
- Base for this slice: `d76e1948b7418f6b1578581fc19ba6f2373d1e4c`.
- Product commit: `4852c5bbbc1e7f8101b7d64ddcb318366c1cffa0`.
- Previous CI-fix commit: `3d1fcaa952a9b1117456de263eef38c0f9a588bd`.
- Latest test-fix commit: `debdf42a91978bb897c765edaabe1ead1ec75342`.
- State refresh commit: pending.
- Open PRs at run start: `#103` only.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Work in this run
- Re-read repository metadata, exact `main`, branches, open PRs, exact PR head, workflow runs, jobs, and logs.
- Added `packages/flutter_presentation/test/watch_progress_sections_test.dart` for deterministic History and Continue Watching rendering.
- Exact-head Core contracts run `284` failed only in `flutter-presentation` because `find.text('continue-title')` matched two rendered labels; the failure was at test line 43, not a product/runtime defect.
- `flutter-app-shell`, `flutter-native-player`, `flutter-local-data`, architecture, design tokens, metadata, resolver, provider SDK, TVmaze, and other package jobs succeeded.
- Audit hygiene run `431` succeeded.
- Fixed the first test issue on the same PR by asserting `findsNWidgets(2)` for the repeated content label and tapping the keyed item finder.
- The next exact-head run exposed a second duplicate rendered progress label (`S2 E3 • 30%`); fixed that assertion on the same PR in `debdf42a91978bb897c765edaabe1ead1ec75342` by asserting `findsNWidgets(2)`.
- No external-browser playback, proxy/relay, DRM/paywall bypass, or secrets introduced.

## Acceptance criteria
- Completed items remain visible in History and are not treated as Continue Watching by the collection contract.
- In-progress items render in Continue Watching with progress and episode context.
- Tap callbacks receive the presentation-safe item only.
- Empty History and Continue Watching states render independently.
- The integration test uses presentation-safe models and remains independent of storage, provider SDKs, stream URLs, and credentials.

## CI / artifacts
- Audit hygiene run `431`: success.
- Core contracts run `284`: failure caused by duplicate text finder in the new test; fixed in commit `3d1fcaa952a9b1117456de263eef38c0f9a588bd`.
- The follow-up test fix is committed at `debdf42a91978bb897c765edaabe1ead1ec75342`; workflow execution for this exact head is pending.
- No release artifact evidence exists for this slice.
- Runtime/device E2E is not claimed by this test alone.

## Open acceptance / blockers
### P0
1. Prove an authorized production playback path; none is currently verified.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Connect the presentation widget to a real runtime data flow and verify lifecycle behavior.
4. Complete Native Player runtime evidence and same-SHA platform artifacts plus device smoke.
5. Build and inspect Android Mobile APK, Android TV APK, unsigned IPA where permitted, and Web artifact from one exact SHA.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this slice is not merged and adds package-level integration evidence only; no authorized playback, device/platform, or release-artifact proof exists.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Run exact-head CI for fix commit `debdf42a91978bb897c765edaabe1ead1ec75342` and repair any further failures from logs on the same PR only.
2. Merge only after exact-head CI is green and `mergeable=true`.
3. Re-read `main` and refresh this document with the real merge SHA.
4. Connect the widget to actual runtime data flow and add integration/device evidence.
5. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
6. Recompute the four percentages from newly verified merged evidence only.
