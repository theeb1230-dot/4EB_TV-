# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `eb23a46fa807a1e29bc8a7ae168d79bb46d1ef2e`.
- Open PR at run start: `#106` (`core/watch-progress-local-runtime`).
- Base for this slice: `eb23a46fa807a1e29bc8a7ae168d79bb46d1ef2e`.
- Exact PR head before merge: `f1c7a31bcd9ccf8128faaa7608e8792715d1208c`.
- Exact `main` after merge: `1612e3b9dd4019df7a0fa74c4df1c486af548dfd`.
- Merge method: squash merge with expected-head protection.
- Open PRs after merge: none verified.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall/access-control bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Blockers after this merge
### P0
1. Wire the merged `WatchProgressLocalRuntime` into the actual application composition root and prove lifecycle persistence in runtime.
2. Prove the authorized Search -> Details -> Episodes -> Resolve -> Native Play path; none is currently verified.
3. Complete Native Player runtime evidence: buffering/retry, source switching, resume, subtitles/audio, next episode, PiP, Cast/AirPlay where permitted.
4. Build and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Work completed in this run
- Re-read repository metadata, exact `main`, branches/PR state, PR #106, workflow runs/jobs, state docs, constitution, and the local-data/runtime code.
- Exact-head CI for PR head `f1c7a31bcd9ccf8128faaa7608e8792715d1208c`:
  - Core contracts run `316`: success.
  - Audit hygiene run `466`: success.
  - All listed Core contracts jobs succeeded, including `flutter-local-data`, `flutter-presentation`, `flutter-app-shell`, `flutter-native-player`, architecture, contract/domain tests, metadata, resolver, provider SDK, TVmaze provider, playback orchestrator, and local data packages.
- PR #106 merged with expected-head protection; merge SHA `1612e3b9dd4019df7a0fa74c4df1c486af548dfd`.
- Merged slice adds a local-first `WatchProgressLocalRuntime` over `LocalKeyValueStore`, JSON round-trip persistence, fail-closed malformed payload handling, clear support, and focused tests.
- No provider SDK, stream URL, credential, proxy/relay, DRM/paywall bypass, external-browser playback, or secret was added.

## Acceptance criteria
### Closed
- Local persistence adapter uses the existing storage boundary.
- Presentation receives only `WatchProgressSurfaceCollection` / `WatchProgressSurfaceItem` models.
- Provider and stream concerns remain outside the adapter.
- Round-trip, invalid-payload, and clear tests are present.
- Architecture policy explicitly documents the intended local Flutter composition edge.
- Exact-head CI was green before merge.
- PR was mergeable and merged with expected-head protection.
### Open
- Runtime adapter still needs wiring into the real application composition root and lifecycle proof.
- Authorized playback E2E, platform artifacts, and device smoke remain unproven.

## CI / artifacts
- Core contracts run `316`: success.
- Audit hygiene run `466`: success.
- No release artifact evidence exists for this slice.
- No Releases were verified.
- Runtime/device E2E is not claimed by this adapter alone.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this merge improves local persistence infrastructure but does not prove authorized playback, device/platform behavior, or release artifacts.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Wire `WatchProgressLocalRuntime` into the actual composition root and add lifecycle/runtime evidence.
2. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
3. Add Native Player lifecycle evidence: buffering, retry, source switching, resume, subtitle/audio handling, next episode, PiP, Cast/AirPlay where platform permits.
4. Build and inspect same-SHA platform artifacts with provenance, manifests, signing state, and SHA256.
5. Run device smoke for Android Mobile, Android TV, iOS, and Web/PWA.
6. Recompute the four percentages from newly verified merged evidence only.
