# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `d76e1948b7418f6b1578581fc19ba6f2373d1e4c`.
- PR worked this run: pending creation from `presentation/watch-progress-integration`.
- Base for this slice: `d76e1948b7418f6b1578581fc19ba6f2373d1e4c`.
- Product commit: `4852c5bbbc1e7f8101b7d64ddcb318366c1cffa0`.
- State refresh commit: pending.
- Open PRs at run start: none verified.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Work in this run
- Re-read repository metadata, exact `main`, branches, open PRs, and current source files.
- Added `packages/flutter_presentation/test/watch_progress_sections_test.dart`.
- Added widget integration coverage for deterministic History and Continue Watching rendering.
- Verified both completed and in-progress items render in the expected sections.
- Verified progress labels, episode context, item tap forwarding, and independent empty states.
- The test uses `WatchProgressSurfaceCollection` and `WatchProgressSections`; it does not couple UI to storage, provider SDKs, stream URLs, or credentials.

## Acceptance criteria
- Completed items remain visible in History and are not treated as Continue Watching by the collection contract.
- In-progress items render in Continue Watching with progress and episode context.
- Tap callbacks receive the presentation-safe item only.
- Empty History and Continue Watching states render independently.
- No external-browser playback, proxy/relay, DRM/paywall bypass, or secrets introduced.

## CI / artifacts
- Exact-head CI for this new slice is pending PR creation and workflow execution.
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
1. Run exact-head CI for this slice and repair failures from logs on the same PR only.
2. Merge only after exact-head CI is green and `mergeable=true`.
3. Re-read `main` and refresh this document with the real merge SHA.
4. Connect the widget to actual runtime data flow and add integration/device evidence.
5. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
6. Recompute the four percentages from newly verified merged evidence only.
