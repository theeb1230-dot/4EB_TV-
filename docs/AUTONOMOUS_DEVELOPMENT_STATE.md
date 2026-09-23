# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `dee8ffc0e98437d6404b1c09876a52bd26b9c27e`.
- PR #97 `Core: add local History and Continue Watching contract` exact head before CI repair: `9a36317a2c5b4c60212bcc481dc50c8730a6f60f`.
- Exact-head Audit hygiene run 395 = success.
- Exact-head Core contracts run 259 = failure only in `test (core_domain)` formatting; architecture and all other completed jobs passed, with several matrix jobs cancelled after the failure.
- Failure cause was formatter drift in `watch_progress.dart` and `watch_progress_test.dart`; no logic or dependency-boundary failure was reported.
- Same-branch formatter repair commit: `272c0468758164f7258f47bae25158f8ea9a67fe` on `core/history-continue-watching-contract`.
- New exact-head CI for `272c046...` was not visible at the end of this run; PR #97 remains open and must not be merged until green and mergeable.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. `WatchProgress` domain contract added for History and Continue Watching.
2. `WatchProgressStore` persists only local playback metadata through `LocalKeyValueStore` and the existing history scope.
3. Corrupt state fails closed and stale zero-position entries are deleted.
4. Round-trip, cleanup, and corrupt-state regression tests were added.
5. Dart formatter drift identified from exact CI logs and repaired on the same PR branch.

## Open acceptance
1. Exact-head CI for `272c046...` must be green across the required checks.
2. PR #97 must become `mergeable=true` and be merged with expected-head protection.
3. The contract must be wired into History + Continue Watching runtime/UI lifecycle with integration evidence.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback. Integrate only a lawful authorized source behind ProviderRegistry/Resolver when actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete local History + Continue Watching UI lifecycle around the now-merged runtime resume integration; the domain contract is being added, but the product loop is not yet proven end-to-end.
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
| Core | 10 | 58% | 5.8 |
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
| Security/performance/tests | 3 | 64% | 1.9 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 51.0%** from merged evidence; branch-only PR #97 work does not earn merged credit yet.
- **Current Phase Completion: 34%** for active Native Playback/E2E phase.
- **Verified Functional Completion: 49%**.
- **Beta Readiness: 60%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; no branch-only work earns merged/verified credit.

## What changed in this run
- Re-read current main and open PR state rather than inheriting prior status.
- Inspected exact-head PR #97 jobs and logs.
- Fixed the formatter-only failure in `core_domain` on the same PR branch with commit `272c046...`.
- Updated this state document on the same PR branch to record exact SHAs, CI evidence, open acceptance, blockers, and next targets.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- History + Continue Watching UI lifecycle is not yet demonstrated end-to-end.
- New exact-head CI for `272c046...` has not appeared yet, so mergeability and merge are unproven.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Advanced player controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Verify exact-head CI for `272c046...` and inspect failures from logs only.
2. Merge PR #97 only after green and `mergeable=true`.
3. Re-read `main` after merge and update this document again with the actual merge SHA.
4. Wire the merged History/Continue Watching contract into runtime/UI lifecycle with integration tests.
5. Audit only lawful authorized playback candidates/configuration; keep blocker open if none exists.
6. Continue buffering/error lifecycle and next/countdown prerequisites.
7. Build and inspect same-SHA platform artifacts once runtime path is sufficiently complete for meaningful Beta smoke.
