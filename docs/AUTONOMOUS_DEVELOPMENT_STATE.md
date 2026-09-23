# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `e79f3a4164cd3026edff97139fdb056c4dd2a13e`.
- PR #95 `Player: persist local resume checkpoints` exact head: `9b5aa54b3e65839b1f902edfd8d7968b94f023fb`.
- Exact-head Actions verified green: `Audit hygiene` run 388 = success; `Core contracts` run 254 = success.
- PR #95 was verified `mergeable=true` and merged with expected-head protection.
- Merge commit / resulting main before this documentation commit: `c285eadc235efdee156ae8669bf4c718dbe59779`.
- PR #95 adds local-first durable resume checkpoint persistence behind the core-domain storage boundary, including round-trip persistence, zero-position cleanup, and corrupt-state fail-closed regression coverage without coupling the native player package directly to persistent storage.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. Durable local resume checkpoint round-trip is implemented behind the storage abstraction.
2. Zero-position checkpoints remove stale progress.
3. Corrupt checkpoint state is removed/fails closed instead of crashing the product path.
4. Architecture boundary is preserved: native player no longer directly depends on `local_data_persistent`.
5. PR #95 exact-head CI was green, mergeable, and merged.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback. Integrate only a lawful authorized source behind ProviderRegistry/Resolver when actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Integrate the merged native `activePosition()` checkpoint with the merged durable resume store and local History + Continue Watching lifecycle; persistence primitives alone are not runtime integration evidence.
4. Complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
5. Complete local Favorites + History + Continue Watching product loop.
6. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

### P1
Downloads/offline; authorized Live/Sports/EPG; Experience Engine Preview/Apply; local profile/recommendations/feedback/Incognito/Collections/backup and optional Zero-PII sync.

### P2
Stable/Beta update discovery, Developer Mode, privacy-safe diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
| Product area | Weight | Verified item completion | Weighted points |
|---|---:|---:|---:|
| Governance + 30-source audit | 10 | 78% | 7.8 |
| Architecture/workspace | 7 | 80% | 5.6 |
| Design System | 6 | 78% | 4.7 |
| Core | 10 | 56% | 5.6 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 50% | 5.0 |
| Experience + content UI | 8 | 47% | 3.8 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 18% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 61% | 1.8 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 50.5%** from merged evidence; weighted table is deliberately conservative and does not count runtime integration that is not yet proven.
- **Current Phase Completion: 32%** for active Native Playback/E2E phase.
- **Verified Functional Completion: 47%**.
- **Beta Readiness: 58%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; no branch-only work earns merged/verified credit.

## What changed in this run
- Re-read current main and open PR state rather than inheriting prior status.
- Verified PR #95 exact head `9b5aa54b...` was `mergeable=true`.
- Verified both exact-head workflows successful: Audit hygiene run 388 and Core contracts run 254.
- Merged PR #95 using expected-head protection; verified signed resulting main `c285eadc...`.
- Updated this handoff after the merge with the next actual integration blocker.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- Native active-position sampling is not yet wired end-to-end to the durable resume store and History/Continue Watching UI lifecycle.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Advanced player controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Re-read main after this documentation commit and confirm no new/open conflicting PR.
2. Wire `NativePlaybackAdapter.activePosition()` to durable resume persistence plus local History/Continue Watching lifecycle with integration tests.
3. Audit only lawful authorized playback candidates/configuration; keep blocker open if none exists.
4. Continue buffering/error lifecycle and next/countdown prerequisites.
5. Build and inspect same-SHA platform artifacts once runtime path is sufficiently complete for meaningful Beta smoke.
