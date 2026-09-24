# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `8e7c84f6450674aa150988f3cbddf90093c8896c`.
- PR worked this run: `#104` (`presentation/watch-progress-runtime-bridge`).
- Base for this slice: `8e7c84f6450674aa150988f3cbddf90093c8896c`.
- Exact PR head merged: `38355ee8e910e4edfb98e41306aa3642a4840108`.
- Exact `main` after merge: `962a61d35ebc9cccf2712ba1ae6b960b82cf7df2`.
- Merge method: squash merge with expected-head protection.
- Open PRs after merge: none verified.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Work in this run
- Re-read repository metadata, exact `main`, open PRs, exact PR head, workflow runs/jobs, changed files, and relevant code.
- Confirmed exact-head Core contracts run `302` for head `38355ee8e910e4edfb98e41306aa3642a4840108` succeeded; Audit hygiene run `450` also succeeded.
- Confirmed all observed Core contracts jobs succeeded, including `flutter-presentation`, `flutter-app-shell`, `flutter-local-data`, `flutter-native-player`, architecture, metadata, resolver, provider SDK, TVmaze provider, and playback orchestrator.
- Merged PR #104 with expected-head protection; merge SHA `962a61d35ebc9cccf2712ba1ae6b960b82cf7df2`.
- The merged slice adds a presentation/runtime bridge backed by a presentation-safe `ValueListenable<WatchProgressSurfaceCollection>`, section-scoped stable keys, and widget rebuild coverage for History and Continue Watching.
- No competing PR was opened.
- No external-browser playback, proxy/relay, DRM/paywall bypass, or secrets introduced.

## Acceptance criteria closed
- A local presentation projection can update the widget without recreating the widget tree.
- History and Continue Watching remain derived from `WatchProgressSurfaceCollection`.
- The bridge exposes only presentation-safe models and remains independent of storage/provider implementations.
- The widget test proves rebuild behavior and uses stable section-scoped item identity.
- Exact-head CI is green for the merged head: Audit hygiene `450`; Core contracts `302`.

## CI / artifacts
- Exact-head Audit hygiene run `450`: success.
- Exact-head Core contracts run `302`: success.
- No release artifact evidence exists for this slice.
- Runtime/device E2E is not claimed by this bridge alone.
- No Releases were verified.

## Open acceptance / blockers
### P0
1. Prove an authorized production playback path; none is currently verified.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Connect the presentation bridge to a real runtime data source and verify lifecycle behavior on supported platforms.
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

These remain unchanged because this slice adds presentation/runtime integration evidence only; no authorized playback, device/platform, or release-artifact proof exists.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Connect the bridge to an actual runtime data source and add lifecycle/device evidence.
2. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
3. Add Native Player lifecycle evidence: buffering, retry, source switching, resume, subtitle/audio handling, next episode, PiP, Cast/AirPlay where platform permits.
4. Build and inspect same-SHA platform artifacts with provenance, manifests, signing state, and SHA256.
5. Run device smoke for Android Mobile, Android TV, iOS, and Web/PWA.
6. Recompute the four percentages from newly verified merged evidence only.
