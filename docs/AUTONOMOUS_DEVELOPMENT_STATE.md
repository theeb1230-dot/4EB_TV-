# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `eb23a46fa807a1e29bc8a7ae168d79bb46d1ef2e`.
- Open PRs at run start: none verified.
- Current branch: `core/watch-progress-local-runtime`.
- Branch base: `eb23a46fa807a1e29bc8a7ae168d79bb46d1ef2e`.
- Current PR: `#106`.
- Current PR head after latest fix: `23aaa5796da33b571680723ef66b339aaffcdd47`.
- PR URL: https://github.com/theeb1230-dot/4EB_TV-/pull/106
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Blockers
### P0
1. Prove local persistence/composition for History + Continue Watching without provider/UI coupling.
2. Prove the authorized Search -> Details -> Episodes -> Resolve -> Native Play path; none is currently verified.
3. Complete Native Player runtime evidence: buffering/retry, source switching, resume, subtitles/audio, next episode, PiP, Cast/AirPlay where permitted.
4. Build and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Work completed in this run
- Re-read repository metadata, exact `main`, branches, open PRs, current state document, local-data edge, persistent storage APIs, and presentation/runtime code.
- Selected the highest independently provable blocker: local watch-progress persistence/composition.
- Created `WatchProgressLocalRuntime` in `packages/local_data_flutter/lib/watch_progress_local_runtime.dart`.
- Added JSON round-trip persistence under `LocalDataScope.playbackProgress` with namespaced key `watch-progress-v1`.
- Added fail-closed decoding for malformed or non-list payloads.
- Exported the adapter from `local_data_flutter.dart`.
- Added direct dependencies on `core_domain` and `presentation_contract`.
- Added focused tests for round-trip, invalid payload handling, and clear behavior.
- Corrected invalid const collection construction before CI submission.
- Opened PR #106 against `main`.
- No provider SDK, stream URL, credential, proxy/relay, DRM/paywall bypass, external-browser playback, or secret was added.

## Acceptance criteria
### Closed on branch
- Persistence is local-first and uses the existing `LocalKeyValueStore` boundary.
- Presentation receives only `WatchProgressSurfaceCollection` / `WatchProgressSurfaceItem` models.
- Provider and stream concerns remain outside the adapter.
- Round-trip, invalid-payload, and clear tests are authored.
### Open
- Exact-head CI has not yet run for PR #106 head `23aaa5796da33b571680723ef66b339aaffcdd47`.
- Runtime adapter is not yet merged or wired into the application composition root.
- Authorized playback E2E, platform artifacts, and device smoke remain unproven.

## CI / artifacts
- No exact-head workflow run exists yet for `23aaa5796da33b571680723ef66b339aaffcdd47`.
- No release artifact evidence exists for this slice.
- No Releases were verified.
- Runtime/device E2E is not claimed by this adapter alone.

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
1. Wait for fresh exact-head CI for PR #106.
2. Fix any failure from logs on PR #106 branch only, then merge only after exact-head CI is green and the PR is mergeable.
3. Wire the adapter into the actual application composition root after merge.
4. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
5. Build and inspect same-SHA platform artifacts with provenance, manifests, signing state, and SHA256.
6. Run device smoke for Android Mobile, Android TV, iOS, and Web/PWA.
7. Recompute the four percentages from newly verified merged evidence only.
