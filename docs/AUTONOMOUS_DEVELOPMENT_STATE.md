# 4BA Autonomous Development State

GitHub is the source of truth.

## Current source truth
- Exact start main: `53e0b0935fc2db020601476e94484660929340d7`
- PR #99: `Presentation: expose History and Continue Watching surface contract`
- Previous exact head: `069da41f94b5c5dcfd3f3b896154f2d89406ab06`
- Current exact head after architecture repair: `418c46c080a8ffc25c4af258c9113a5e6a040622`
- Core contracts run 270: failed only because architecture checker rejected `presentation_contract -> core_domain`.
- Architecture repair removed the forbidden dependency and replaced domain/storage coupling with a presentation-side reader interface.
- New exact-head workflow runs are not yet visible for `418c46c080a8ffc25c4af258c9113a5e6a040622` at this refresh.
- PR #99 is open and not merged.
- TVmaze is metadata/discovery only, never playback.
- No Beta usable, Golden, or Production claim.

## Invariants
ZERO_COST core; ZERO_ADS; Zero-PII; local-first; native playback first; internal WebView last fallback; no external-browser playback; no DRM/paywall bypass; no secrets; no paid-backend requirement; no GitHub/4BA media proxy; Metadata != Streams; Watch != Download; provider/UI separation; Arabic RTL default plus English/Turkish; Cinematic Gold dark-only V1.

## Closed this run
- Diagnosed the exact architecture failure from job logs.
- Removed `core_domain` from `presentation_contract` dependencies.
- Replaced the domain-coupled factory/reader with a platform-neutral projection and presentation-side reader interface.
- Updated tests to construct the surface contract from primitives only.
- Preserved provider streams, credentials, storage implementation details, and Zero-PII boundaries out of the surface model.

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
- Fixed the concrete architecture failure on the same PR branch.
- Updated this state file with the exact repair SHA and current blockers.

## Next targets
1. Read exact-head CI for PR #99 and fix only concrete failures on the same branch.
2. Merge PR #99 after green CI and mergeability.
3. Wire the surface contract into real History/Continue Watching UI/runtime.
4. Continue lawful playback-path audit without inventing a provider.
5. Build and inspect same-SHA platform artifacts.
