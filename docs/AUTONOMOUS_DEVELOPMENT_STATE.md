# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `885cf054e472897bbec491b7c6b2bda119ed709c`.
- Open PRs at run start: PR #101 only.
- Working branch: `presentation/watch-progress-collections`.
- Product change commit: `1ffd7dc5de6882090ea23579d9f53f3811bda25c`.
- CI repair commit: `c187f16975da381b45a10e0fe788a7280749f7aa`.
- Root-cause fix commit: `92c683a3476ef63a2b161ec25fa1b4be4c81257b`.
- Verified exact-head CI passed on `92c683a3476ef63a2b161ec25fa1b4be4c81257b`: Audit hygiene run `425` success; Core contracts run `280` success; `flutter-app-shell`, `flutter-presentation`, `presentation_contract`, architecture, local-data, native-player, resolver, provider, metadata, core-domain, design-token, and capability-kernel jobs all passed.
- PR #101 merge commit: `732f00056413a9637abbbca3b342142ccc3d8730`.
- Current `main` after merge: `732f00056413a9637abbbca3b342142ccc3d8730` before this state refresh commit.
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
- Read the actual logs for Core contracts run `278`.
- Confirmed the root cause: `WatchProgressSurfaceCollection` used a `const` constructor while initializing `_items` with the non-const `List.unmodifiable` factory, producing `invalid_constant` at `lib/src/watch_progress_surface_collection.dart:9:18` and causing downstream Flutter test compilation failures.
- Fixed that root cause on the same PR branch by removing the invalid `const` constructor modifier while preserving the immutable defensive copy.
- Verified fresh exact-head CI after the fix and merged PR #101 with expected-head protection.

## Acceptance evidence
- Core contracts run `280` completed successfully.
- Audit hygiene run `425` completed successfully.
- `flutter-app-shell` and `flutter-presentation` passed after the root-cause fix.
- Architecture, local-data, native-player, resolver, provider, metadata, core-domain, design-token, presentation contract, and capability-kernel jobs passed their analyze/test stages.
- PR #101 merged at exact merge SHA `732f00056413a9637abbbca3b342142ccc3d8730`.
- No runtime/platform E2E evidence is claimed by this change.

## Open acceptance / blockers
### P0
1. Prove an authorized production playback path; none is currently verified.
2. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
3. Complete History + Continue Watching UI/runtime lifecycle around the merged presentation surface contract and collection policy.
4. Complete Native Player runtime evidence for buffering/error/retry, quality, audio/subtitles, local SRT/VTT, next/countdown, PiP, and Cast/AirPlay where supported.
5. Produce and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain merged-evidence figures only. This merge adds verified contract/test evidence but no runtime/platform evidence, so the four percentages remain unchanged.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Wire the merged collection into real History and Continue Watching UI/runtime with integration evidence.
2. Continue lawful playback-path audit without inventing a provider or converting TVmaze into a stream provider.
3. Add Native Player lifecycle coverage for buffering/error/retry and next/countdown.
4. Build and inspect same-SHA platform artifacts and provenance.
5. Recompute the four percentages from the next verified merged evidence only.
