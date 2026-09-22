# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `2c66892099fc3adbf4b8f97fd381101778e83f97`.
- PR #94 `Player: expose active resume checkpoint` exact head: `367ece5b5767a25ffabeb200474ad0e1a73de3e0`.
- Exact-head Actions were verified green: `Audit hygiene` run 378 = success; `Core contracts` run 245 = success.
- PR #94 was verified `mergeable=true` and merged with expected-head protection. Merge commit / resulting main before this documentation commit: `ae8ac468686a079a0292d81a2d02c34fb456bb39`.
- PR #94 supplies `NativePlaybackAdapter.activePosition()` so higher layers can read the active native-session position without coupling to `video_player`; no active session returns null. Regression coverage includes active/stopped lifecycle and preserves retry/same-position source switching.
- TVmaze remains discovery/metadata-only. No playback/download capability is inferred or added.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Closed acceptance in this run
1. Higher layers can read a resume checkpoint from the active native session without reaching into `video_player`.
2. With no active session, checkpoint lookup returns null and creates no playback session.
3. After stop/disposal, checkpoint lookup returns null.
4. Existing retry and same-position source-switch behavior remains covered.
5. PR #94 exact-head CI was green, mergeable, and merged.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, bypass, relay, or turn TVmaze into playback. Integrate only a lawful authorized source behind ProviderRegistry/Resolver when actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Wire native resume checkpoints into local History + Continue Watching persistence; then complete buffering/error lifecycle, HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, next/countdown, PiP and platform-supported Cast/AirPlay.
4. Complete local Favorites + History + Continue Watching product loop.
5. Produce and inspect same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, then collect platform/device smoke evidence.

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
| Core | 10 | 55% | 5.5 |
| Provider SDK/config | 6 | 60% | 3.6 |
| Metadata | 5 | 60% | 3.0 |
| Search/Resolver | 6 | 58% | 3.5 |
| Native Player | 10 | 48% | 4.8 |
| Experience + content UI | 8 | 47% | 3.8 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 15% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 60% | 1.8 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 50.1%** from merged evidence.
- **Current Phase Completion: 30%** for active Native Playback/E2E phase.
- **Verified Functional Completion: 46%**.
- **Beta Readiness: 57%**; not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts remain absent.
- Percentages may fall when new evidence exposes a gap; no branch-only work earns merged/verified credit.

## What changed in this run
- Re-read PR #94 rather than inheriting prior status.
- Verified exact head `367ece5b...` with both required workflows successful and mergeability true.
- Merged PR #94 with expected-head protection; verified resulting signed main merge `ae8ac468...`.
- Updated this handoff after the merge.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- Resume checkpoint persistence into local History/Continue Watching is not yet wired; the merged player boundary is only the prerequisite.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- Advanced player controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Re-read main after this documentation commit and confirm no new/open conflicting PR.
2. Wire resume checkpoints into local History/Continue Watching persistence with integration tests.
3. Audit only lawful authorized playback candidates/configuration; keep blocker open if none exists.
4. Continue buffering/error lifecycle and next/countdown prerequisites.
5. Build and inspect same-SHA platform artifacts once runtime path is sufficiently complete for meaningful Beta smoke.
