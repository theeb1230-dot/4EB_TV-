# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `57a14f4ea1af8d8a79befeb0eec6433148ac981f`.
- No PR was open at run start.
- Working branch: `core/watch-progress-runtime-controller`.
- Base for this slice: `57a14f4ea1af8d8a79befeb0eec6433148ac981f`.
- Current branch head before PR creation: `66062de51d8116a5df4a182bc858de43a1423ee3`.
- Open PR after this run: pending creation; no merge is claimed.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Blockers selected this run
### P0
1. Connect the merged History + Continue Watching presentation bridge to a real local runtime source without provider/UI coupling.
2. Prove the authorized Search -> Details -> Episodes -> Resolve -> Native Play path; none is currently verified.
3. Build and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Work in this run
- Re-read repository metadata, exact `main`, branches, open PRs, current state documentation, and the presentation/runtime code.
- Added `WatchProgressRuntimeController` in `packages/flutter_presentation/lib/src/watch_progress_runtime_controller.dart`.
- The controller owns only `WatchProgressSurfaceCollection` projections and exposes a `ValueListenable` for the UI.
- Added `replaceAll`, `upsert`, `remove`, `value`, and `dispose` lifecycle operations.
- Exported the controller from `flutter_presentation.dart`.
- Added focused tests for replacement, completed-item filtering through the existing contract, removal, and listenable notifications.
- No provider SDK, stream URL, credential, proxy/relay, DRM/paywall bypass, or external-browser playback behavior was added.

## Acceptance criteria
### Closed on branch
- Presentation can consume a local runtime controller without depending on storage or provider packages.
- Upsert replaces the same `contentId` deterministically.
- Remove updates the listenable projection and lifecycle can be disposed.
- Tests cover the controller's core state transitions.
### Open
- Exact-head CI for the eventual PR head must be green.
- PR must be mergeable and then merged with expected-head protection.
- Runtime source must be wired from actual local persistence/composition, not just the controller.
- Authorized playback E2E, platform artifacts, and device smoke remain unproven.

## CI / artifacts
- No new exact-head workflow result is available yet for this branch head.
- No release artifact evidence exists for this slice.
- Runtime/device E2E is not claimed by this controller alone.
- No Releases were verified.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this controller is branch-only and does not yet prove merged runtime/platform behavior.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Verify exact-head CI for the new PR.
2. Fix any real failure from logs on the same PR only; do not rerun blindly.
3. Merge only after green and mergeable with expected-head protection.
4. Re-read `main` after merge and refresh this file with the real merge SHA.
5. Wire the controller to actual local persistence/composition and add lifecycle evidence.
6. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
7. Build and inspect same-SHA artifacts and collect Android Mobile, Android TV, iOS, and Web/PWA smoke evidence.
