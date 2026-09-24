# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `8e7c84f6450674aa150988f3cbddf90093c8896c`.
- PR worked this run: `#104` (`presentation/watch-progress-runtime-bridge`).
- Base for this slice: `8e7c84f6450674aa150988f3cbddf90093c8896c`.
- PR head before repair: `9263ac2656b935f59c4218e6380fe6bbc401af6f`.
- Previous repair commits: `d03cb9ddd9d44beaa938c78bb04f5ab76f161d75`, `23965d6325e1c0254f49524bb8fdad40a0c28999`.
- Formatting repair commits: `8319fd789645c7491c4cc2a439cc25db533df490`, `42e730c7e0a4067e3966fed2f6cefb752939bf5f`.
- Current branch head after formatting repair: `42e730c7e0a4067e3966fed2f6cefb752939bf5f`.
- Open PRs at run start: `#104` only.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Work in this run
- Re-read repository metadata, exact `main`, branches, open PRs, exact PR head, workflow runs/jobs, logs, and changed code.
- Diagnosed Core contracts run 293: `flutter-presentation` failed at `dart format .` because the two repaired files were not formatter-clean.
- Applied the exact formatter output to `watch_progress_sections.dart` and `watch_progress_sections_builder_test.dart` on PR #104.
- Updated this state file on the same PR branch; no competing PR was opened.
- No external-browser playback, proxy/relay, DRM/paywall bypass, or secrets introduced.

## Acceptance criteria
- A local presentation projection can update the widget without recreating the widget tree.
- History and Continue Watching remain derived from `WatchProgressSurfaceCollection`.
- The bridge exposes only presentation-safe models and remains independent of storage/provider implementations.
- The widget test proves rebuild behavior and uses stable section-scoped item identity.
- Fresh exact-head CI must run for head `42e730c7e0a4067e3966fed2f6cefb752939bf5f`; no green claim is made yet.

## CI / artifacts
- Previous exact-head evidence for `9263ac2656b935f59c4218e6380fe6bbc401af6f`: Audit hygiene run 438 succeeded; Core contracts run 290 failed in `flutter-app-shell` test execution.
- Repair head `eabadd20c6abd07c4eee9ce99cf10ee722d9490f`: Audit hygiene run 441 succeeded; Core contracts run 293 failed only in `flutter-presentation` formatting.
- Current repair head `42e730c7e0a4067e3966fed2f6cefb752939bf5f` is awaiting fresh exact-head workflow runs.
- No release artifact evidence exists for this slice.
- Runtime/device E2E is not claimed by this bridge alone.

## Open acceptance / blockers
### P0
1. Prove an authorized production playback path; none is currently verified.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Connect the presentation bridge to a real runtime data source and verify lifecycle behavior on supported platforms.
4. Complete Native Player runtime evidence and same-SHA platform artifacts plus device smoke.
5. Build and inspect Android Mobile APK, Android TV APK, unsigned IPA where permitted, and Web artifact from one exact SHA.
6. Obtain fresh exact-head CI for PR #104 and merge only when green and `mergeable=true`.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this slice is not merged and adds presentation integration evidence only; no authorized playback, device/platform, or release-artifact proof exists.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Read fresh exact-head CI for head `42e730c7e0a4067e3966fed2f6cefb752939bf5f` and repair failures from logs on PR #104 only.
2. Merge only after exact-head CI is green and `mergeable=true`.
3. Re-read `main` and refresh this document with the real merge SHA.
4. Connect the bridge to an actual runtime data source and add device evidence.
5. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
6. Recompute the four percentages from newly verified merged evidence only.
