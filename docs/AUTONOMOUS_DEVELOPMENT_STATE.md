# 4BA Autonomous Development State

GitHub is the source of truth. This file is refreshed after each verified merge.

## Current source truth
- Exact `main` at run start: `fa8ddd36945743de3c1b55dd02e5984ad8d87651`.
- Open PRs at run start: none.
- Working branch: `presentation/watch-progress-widgets`.
- Product commits: `22edb692e3cacdb8e41548d52b6d3b5b7c84c148` and `8e108fd89997f6175330afdd05a96d416edf42a6`.
- Releases: none verified.
- TVmaze remains metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Re-read repository metadata, exact `main`, open PRs, and current source files.
- Added `WatchProgressSections` Flutter widget that renders deterministic History and Continue Watching sections from `WatchProgressSurfaceCollection`.
- Preserved provider/UI and storage/UI separation; the widget consumes presentation-safe items only.
- Added progress indicators, episode labels, empty states, and optional tap callback.
- Exported the widget from `flutter_presentation`.
- No stream URLs, provider credentials, or storage internals are exposed.

## Acceptance evidence
- Source compiles conceptually against existing `flutter_presentation` and `presentation_contract` package dependencies.
- Exact-head CI is required before merge; no runtime/platform E2E evidence is claimed by this branch.
- No release artifact evidence exists for this slice.

## Open acceptance / blockers
### P0
1. Run exact-head CI for this branch and fix any failures on the same PR only.
2. Prove an authorized production playback path; none is currently verified.
3. Prove `Search -> Details -> Episodes -> Resolve -> Native Play` with authorized data and provenance separation.
4. Complete UI/runtime lifecycle integration around local History and Continue Watching.
5. Complete Native Player runtime evidence and same-SHA platform artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates; security/license/dependency audits.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.4%**
- Current Phase Completion: **41%**
- Verified Functional Completion: **56%**
- Beta Readiness: **64%**

These remain unchanged because this branch is not merged and adds no runtime/platform proof.

## Overall weighting table
Governance/source audit 10%; Architecture/workspace 7%; Design System 6%; Core 10%; Provider SDK/config 6%; Metadata 5%; Search/Resolver 6%; Native Player 10%; Experience/content UI 8%; Live/Sports 5%; Offline 5%; Profile/local features 3%; Android 4%; Android TV 4%; iOS 4%; Web/PWA 3%; Accessibility/updates 2%; Security/performance/tests 3%; CI/CD/releases 2%; Beta/Golden hardening 1%.

Scoring ceiling per area: docs <=20%; skeleton/contracts <=35%; unit-tested implementation without integration <=60%; integration-tested without runtime/platform evidence <=80%; 100% only with full acceptance criteria and suitable evidence. No double counting and no upward rounding.

## Next targets
1. Run exact-head CI for this branch and fix failures from logs.
2. Merge only after green checks and `mergeable=true`.
3. Re-read `main` and refresh this file with the real merge SHA.
4. Add widget integration tests and connect the widget to actual runtime data flow.
5. Continue lawful playback-path audit and Native Player lifecycle coverage.
6. Build and inspect same-SHA platform artifacts and provenance.
7. Recompute the four percentages from next verified merged evidence only.
