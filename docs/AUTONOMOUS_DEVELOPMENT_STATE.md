# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `dee8ffc0e98437d6404b1c09876a52bd26b9c27e`.
- PR #97 `Core: add local History and Continue Watching contract` exact final head: `36d045152f5532213cd9b28ee80807c91565c221`.
- Exact-head `Audit hygiene` run 397 = success.
- Exact-head `Core contracts` run 261 = success.
- All completed Core contracts matrix jobs passed, including `core_domain`, architecture, local data, native player, resolver, provider, presentation, app flow, and metadata tests.
- PR #97 was mergeable and merged with expected-head protection.
- Resulting merge commit on `main`: `b2dca851beff82bb7660604b2baeac886c0418b0`.
- This document is being refreshed after the merge on `main`.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. `WatchProgress` domain contract added for History and Continue Watching.
2. `WatchProgressStore` persists only local playback metadata through `LocalKeyValueStore` and the existing history scope.
3. Corrupt state fails closed and stale zero-position entries are deleted.
4. Round-trip, cleanup, and corrupt-state regression tests were added.
5. Formatter drift was repaired on the same PR branch.
6. Exact-head CI passed for the final PR head.
7. PR #97 was merged into `main` with expected-head protection.

## Open acceptance
1. Wire the merged History + Continue Watching contract into runtime/UI lifecycle with integration evidence.
2. Prove authorized Search -> Details -> Episodes -> Resolve -> Native Play with provider-local provenance and canonical metadata/stream separation.
3. Complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
4. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback. Integrate only a lawful authorized source behind ProviderRegistry/Resolver when actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete local History + Continue Watching UI lifecycle around the merged resume runtime and merged `WatchProgress` contract; the product loop is not yet proven end-to-end.
4. Complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
5. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine Preview/Apply; local profile/recommendations/feedback/Incognito/Collections/backup and optional Zero-PII sync.

### P2
Stable/Beta update discovery, Developer Mode, privacy-safe diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
| Product area | Weight | Verified item completion | Weighted points |
|---|---:|---:|---:|
| Governance + 30-source audit | 10 | 78% | 7.8 |
| Architecture/workspace | 7 | 82% | 5.7 |
| Design System | 6 | 78% | 4.7 |
| Core | 10 | 62% | 6.2 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 58% | 5.8 |
| Experience + content UI | 8 | 49% | 3.9 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 20% | 0.6 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 66% | 2.0 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 51.4%** from merged evidence; the increase is limited to the merged local History/Continue Watching contract and its green exact-head CI.
- **Current Phase Completion: 36%** for active Native Playback/E2E phase.
- **Verified Functional Completion: 51%**.
- **Beta Readiness: 61%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; no architecture-only or branch-only work earns merged/verified credit.

## What changed in this run
- Re-read current main, branches, PR state, exact-head workflows, jobs, and logs.
- Verified PR #97 final head `36d045...` with green Audit hygiene run 397 and Core contracts run 261.
- Merged PR #97 using expected-head protection; resulting merge commit is `b2dca851...`.
- Re-read `main` after merge.
- Refreshed this state document on `main` with the actual merge SHA, closed/open acceptance, blockers, and evidence-weighted progress.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- History + Continue Watching UI lifecycle is not yet demonstrated end-to-end around the merged runtime checkpoint path and merged domain contract.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Advanced player controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Wire the merged `WatchProgressStore` into History + Continue Watching runtime/UI lifecycle with integration tests.
2. Audit only lawful authorized playback candidates/configuration; keep blocker open if none exists.
3. Continue buffering/error lifecycle and next/countdown prerequisites.
4. Build and inspect same-SHA platform artifacts once runtime path is sufficiently complete for meaningful Beta smoke.
5. Re-read `main` after the next merge and refresh this document again with exact SHAs and evidence.
