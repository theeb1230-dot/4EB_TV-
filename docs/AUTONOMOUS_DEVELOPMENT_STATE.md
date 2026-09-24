# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `57a14f4ea1af8d8a79befeb0eec6433148ac981f`.
- Open PR at run start: `#105` (`core/watch-progress-runtime-controller`).
- Base for this slice: `57a14f4ea1af8d8a79befeb0eec6433148ac981f`.
- Exact PR head before merge: `1941268071e04d3317d55956fbf4386068effa5c`.
- Exact `main` after merge: `b034efe516639001cd2bda33aae342b2a6f33849`.
- Merge method: squash merge with expected-head protection.
- Open PRs after merge: none verified.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Blockers after this merge
### P0
1. Connect the merged History + Continue Watching controller to an actual local persistence/composition source without provider/UI coupling.
2. Prove the authorized Search -> Details -> Episodes -> Resolve -> Native Play path; none is currently verified.
3. Complete Native Player runtime evidence: buffering/retry, source switching, resume, subtitles/audio, next episode, PiP, Cast/AirPlay where permitted.
4. Build and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Work completed in this run
- Re-read repository metadata, exact `main`, open PRs, PR #105, exact-head workflow runs/jobs, and the changed presentation/runtime code.
- Core contracts run `307` for PR head `1941268071e04d3317d55956fbf4386068effa5c`: success.
- Audit hygiene run `456` for the same head: success.
- Observed Core contracts jobs all succeeded, including `flutter-presentation`, `flutter-app-shell`, `flutter-local-data`, `flutter-native-player`, architecture, metadata, resolver, provider SDK, TVmaze provider, playback orchestrator, and contract/domain tests.
- PR #105 merged with expected-head protection; merge SHA `b034efe516639001cd2bda33aae342b2a6f33849`.
- Merged slice adds a presentation-safe `WatchProgressRuntimeController` with replace/upsert/remove/dispose lifecycle operations, `ValueListenable` exposure, and focused tests.
- No provider SDK, stream URL, credential, proxy/relay, DRM/paywall bypass, external-browser playback, or secret was added.

## Acceptance criteria
### Closed
- Controller is independent of storage and provider packages.
- `upsert` deterministically replaces by `contentId`.
- `remove` updates the listenable projection.
- Lifecycle disposal is supported.
- Tests cover replacement, completion filtering, removal, and notifications.
- Exact-head CI was green before merge.
### Open
- Runtime source must be wired from actual local persistence/composition.
- Authorized playback E2E, platform artifacts, and device smoke remain unproven.

## CI / artifacts
- Audit hygiene run `456`: success.
- Core contracts run `307`: success.
- No release artifact evidence exists for this slice.
- No Releases were verified.
- Runtime/device E2E is not claimed by this controller alone.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this merge improves local runtime state handling but does not prove authorized playback, device/platform behavior, or release artifacts.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Wire the controller to actual local persistence/composition and add lifecycle evidence.
2. Continue lawful playback-path audit without inventing a provider or turning TVmaze into a stream provider.
3. Add Native Player lifecycle evidence: buffering, retry, source switching, resume, subtitle/audio handling, next episode, PiP, Cast/AirPlay where platform permits.
4. Build and inspect same-SHA platform artifacts with provenance, manifests, signing state, and SHA256.
5. Run device smoke for Android Mobile, Android TV, iOS, and Web/PWA.
6. Recompute the four percentages from newly verified merged evidence only.
