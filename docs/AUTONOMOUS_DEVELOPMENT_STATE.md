# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main` for this run: `40f2adea00c365c3a7391f241f284eb4509227e1`.
- PR #96 `Player: wire runtime resume checkpoints to native sessions` exact head: `74429496d0864e6c02719ed18557ce95c2c7d06e`.
- Exact-head Actions verified green: `Audit hygiene` run 392 = success; `Core contracts` run 257 = success.
- PR #96 was verified `mergeable=true` and merged with expected-head protection.
- Merge commit / resulting main before this documentation commit: `279d4ff6b1a04b1a0454d98d72610c5905c68d42`.
- PR #96 wires the durable core-domain resume checkpoint store into the native playback session lifecycle: restore on play when no explicit position exists, persist on pause/stop, preserve retry/source-switch behavior, and cover cross-session restore plus zero-position cleanup with regression tests.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. Native player can restore a durable local checkpoint for a supplied content id when no explicit resume position is passed.
2. Native player persists the active position on pause and stop through the injected core-domain store.
3. Zero-position checkpoints remove stale progress.
4. Retry and source switching preserve the active content id and resume semantics.
5. Exact-head CI was green for PR #96 and the PR was mergeable and merged.
6. Architecture boundary remains preserved: native player does not directly depend on `local_data_persistent`.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback. Integrate only a lawful authorized source behind ProviderRegistry/Resolver when actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete local History + Continue Watching UI lifecycle around the now-merged runtime resume integration; persistence is wired into the player, but the product loop is not yet proven end-to-end.
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

- **Overall Product Completion: 51.0%** from merged evidence; the increase is limited to verified native-player runtime integration and green exact-head CI.
- **Current Phase Completion: 34%** for active Native Playback/E2E phase.
- **Verified Functional Completion: 49%**.
- **Beta Readiness: 60%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; no branch-only work earns merged/verified credit.

## What changed in this run
- Re-read current main and open PR state rather than inheriting prior status.
- Verified PR #96 exact head `74429496...` was mergeable.
- Verified both exact-head workflows successful: Audit hygiene run 392 and Core contracts run 257.
- Merged PR #96 using expected-head protection; resulting main merge commit is `279d4ff6...`.
- Updated this handoff after the merge with the next actual integration blocker.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- History + Continue Watching UI lifecycle is not yet demonstrated end-to-end around the now-wired runtime checkpoint path.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Advanced player controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Re-read main after this documentation commit and confirm no new/open conflicting PR.
2. Wire the merged runtime checkpoint path into local History + Continue Watching UI lifecycle with integration tests.
3. Audit only lawful authorized playback candidates/configuration; keep blocker open if none exists.
4. Continue buffering/error lifecycle and next/countdown prerequisites.
5. Build and inspect same-SHA platform artifacts once runtime path is sufficiently complete for meaningful Beta smoke.
