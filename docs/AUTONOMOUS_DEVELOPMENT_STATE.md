# 4BA Autonomous Development State

GitHub is the source of truth.

## Current source truth
- Exact start main: `53e0b0935fc2db020601476e94484660929340d7`
- PR #99: `Presentation: expose History and Continue Watching surface contract`
- Previous exact head: `64812a2a9120323bf0fa5a63dfa6c3db80924df5`
- Core contracts run 272: failed only in `presentation_contract` analysis because the test used `const` with a non-const constructor.
- Fixed the concrete exact-head failure on the same PR branch by removing invalid `const` usage from `watch_progress_surface_test.dart`.
- Current exact head after test repair: `daa37185226453bf1e07bce8fbec48956cac4c7f`
- New exact-head workflow runs are not yet visible for `daa37185226453bf1e07bce8fbec48956cac4c7f` at this refresh.
- PR #99 is open and not merged.
- TVmaze is metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Read current main, open PRs, exact-head workflows/jobs/logs, and repository structure.
- Diagnosed the concrete `presentation_contract` analyzer failure from job logs.
- Removed invalid `const` usage from the failing test on the same PR branch.
- Preserved the presentation/domain boundary and Zero-PII/local-first invariants.

## Open acceptance / blockers
### P0
1. Exact-head CI for PR #99 must be green, then merge only with `mergeable=true`.
2. No authorized production playback path is proven.
3. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data and provenance separation.
4. Complete History + Continue Watching UI/runtime lifecycle around the new surface contract.
5. Produce and inspect same-SHA Android Mobile, Android TV, unsigned IPA where permitted, and Web artifacts plus device smoke.
### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine; local profile/recommendations/backup/sync.
### P2
Update discovery; Developer Mode; privacy-safe diagnostics; performance/accessibility hardening; Golden gates.

## Evidence-weighted progress (merged main only)
- Overall Product Completion: **52.1%**
- Current Phase Completion: **39%**
- Verified Functional Completion: **54%**
- Beta Readiness: **63%**

These remain merged-evidence figures only. The current branch does not change them until CI passes and PR #99 is merged.

## What changed
- Re-read current main, open PRs, exact-head workflows/jobs/logs, and repository structure.
- Fixed the concrete presentation contract analyzer failure on the same PR branch.
- Updated this state file with the exact repair SHA and current blockers.

## Next targets
1. Read exact-head CI for PR #99 and fix only concrete failures on the same branch.
2. Merge PR #99 after green CI and mergeability.
3. Wire the surface contract into real History/Continue Watching UI/runtime.
4. Continue lawful playback-path audit without inventing a provider.
5. Build and inspect same-SHA platform artifacts.
