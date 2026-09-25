# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified run.

## Current source truth
- Exact `main` at run start: `b8fd061d8e9724ed6c2a8d7c1e49f693f481a0e5`.
- No open PR at run start.
- New PR: `#107` (`core/watch-progress-composition-runtime`).
- PR base SHA: `b8fd061d8e9724ed6c2a8d7c1e49f693f481a0e5`.
- Current exact PR head after remediation: `adcb727334773d1b26e803e30fdb6abe214f50a0`.
- PR is open and not merged; exact-head CI is red on formatter drift in `flutter-local-data`.
- Releases: none verified.
- TVmaze remains metadata/discovery-only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall/access-control bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Blockers
### P0
1. Complete exact-head CI for PR #107 and merge only after green + mergeable.
2. Wire the composition runtime into the real app shell and prove lifecycle persistence at runtime.
3. Prove authorized Search -> Details -> Episodes -> Resolve -> Native Play; none is verified yet.
4. Complete Native Player runtime evidence and same-SHA platform artifacts/device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Work completed in this run
- Re-read repository metadata, exact `main`, open PR state, state docs, constitution, local-data code, and application entrypoint.
- Read exact-head CI logs for PR `#107` rather than rerunning blindly.
- Confirmed `Audit hygiene` run `470` passed.
- Confirmed `Core contracts` run `319` failed only in `flutter-local-data` because `dart format .` changed `test/watch_progress_composition_runtime_test.dart` and the workflow then detected a dirty diff.
- Applied the formatter output exactly to `packages/local_data_flutter/test/watch_progress_composition_runtime_test.dart` on the same PR branch.
- No provider SDK, stream URL, credential, proxy/relay, DRM/paywall bypass, external-browser playback, or secret was added.

## Acceptance criteria
### Closed
- Explicit composition boundary exists over the existing local-data boundary.
- `replace` persists the current watch-progress projection.
- `clear` resets memory and durable state.
- Tests cover reload from the same backend and clear semantics.
- Architecture boundary remains provider/UI and metadata/stream safe.
- Formatter drift from the exact-head CI log was applied on the same PR branch.
### Open
- Fresh exact-head CI for `adcb727334773d1b26e803e30fdb6abe214f50a0` has not appeared yet.
- The app shell does not yet consume this runtime; integration and lifecycle/device evidence remain open.
- Authorized playback E2E, platform artifacts, and device smoke remain unproven.

## CI / artifacts
- Audit hygiene run `470`: success.
- Core contracts run `319`: failure in `flutter-local-data` at formatter-diff gate; all other visible jobs passed.
- Remediation commit: `adcb727334773d1b26e803e30fdb6abe214f50a0`.
- No release artifact evidence exists for this slice.
- No Releases were verified.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this PR is not merged and does not prove authorized playback, device/platform behavior, or release artifacts.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Read fresh exact-head CI for PR #107 at `adcb727334773d1b26e803e30fdb6abe214f50a0` and repair only failures from logs on that PR.
2. Merge PR #107 only with green exact-head CI and `mergeable=true` using expected-head protection.
3. Re-read `main` after merge and refresh this file with the real merge SHA.
4. Wire `WatchProgressCompositionRuntime` into the app shell and add lifecycle/runtime evidence.
5. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
6. Build and inspect same-SHA platform artifacts with provenance, manifests, signing state, and SHA256.
7. Run device smoke for Android Mobile, Android TV, iOS, and Web/PWA.
