# 4BA Autonomous Development State

GitHub is the source of truth.

## Current source truth
- Exact start main: `53e0b0935fc2db020601476e94484660929340d7`
- PR #99: `Presentation: expose History and Continue Watching surface contract`
- PR #99 exact head: `3fb187b8b285d6811acb90ecc88d536f64f6e8d4`
- Exact-head workflow runs: not yet visible for the current head at this refresh.
- PR #99 is open and not merged.
- TVmaze is metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Added `WatchProgressSurfaceItem` as a presentation-safe projection of the local `WatchProgress` domain contract.
- Added `WatchProgressSurfaceReader` over `WatchProgressStore`.
- Added progress fraction clamping and completion semantics for UI consumers.
- Added unit coverage for episode context, fraction calculation, clamping, and completion.
- Kept provider streams, credentials, and storage implementation details out of the surface model.

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
- Re-read current main, open PRs, and current repository structure.
- Added a platform-neutral presentation boundary for local History/Continue Watching.
- Added tests and updated this state file on the active PR branch.

## Next targets
1. Read exact-head CI for PR #99 and fix only concrete failures on the same branch.
2. Merge PR #99 after green CI and mergeability.
3. Wire the surface contract into real History/Continue Watching UI/runtime.
4. Continue lawful playback-path audit without inventing a provider.
5. Build and inspect same-SHA platform artifacts.
