# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start/end `main`: `2c66892099fc3adbf4b8f97fd381101778e83f97` at this handoff; it is the verified merge of PR #93.
- No open PR existed at run start. PR #94 is now open from `player/resume-checkpoint`.
- PR #94 exact head at this handoff: `ec91f38f109245005a9ca577ba4708a3ad0e4873` before this documentation commit; re-read the PR head and exact-head CI before any merge.
- PR #94 adds a narrow native-player resume prerequisite: `activePosition()` exposes the active native session position to higher layers for local resume checkpoint persistence without coupling them to `video_player`; it returns null when no session is active. Regression coverage proves active and stopped lifecycle behavior.
- TVmaze remains production discovery/metadata only. It advertises no playback/download capability and remains separated from stream resolution.
- No GitHub Releases were proven at run start. No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Acceptance for current native-player slice
1. Higher layers can read a resume checkpoint from the active native session without reaching into `video_player`.
2. With no active session, checkpoint lookup returns null and creates no session or network work.
3. After stop/disposal, checkpoint lookup again returns null.
4. Existing retry and same-position source-switch behavior remains unchanged and covered by the package regression suite.
5. Exact-head CI must be green and PR #94 mergeable before merge.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, scrape around access controls, relay media, or turn TVmaze into playback. Integrate only a lawful authorized source behind `ProviderRegistry` / Resolver when one is actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete native player HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, buffering/error/retry, resume persistence, same-position source switching/retry, next/countdown, PiP and platform-supported Cast/AirPlay.
4. Complete local Favorites + History + Continue Watching.
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
| Native Player | 10 | 46% | 4.6 |
| Experience + content UI | 8 | 47% | 3.8 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 15% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 58% | 1.7 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 49.8%** on merged `main` after recalculation from current evidence. PR #94 branch-only work is not added to verified product completion until CI/merge.
- **Current Phase Completion: 28%** for the active Native Playback/E2E phase.
- **Verified Functional Completion: 45%**.
- **Beta Readiness: 56%**; this is not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts are still absent.
- Percentages may fall on later runs if new evidence exposes a gap. Branch-only code never earns merged/verified credit.

## What changed in this run
- Re-read current main and confirmed no open PR at start.
- Re-read native-player implementation/tests rather than inheriting the previous handoff.
- Added `NativePlaybackAdapter.activePosition()` and regression coverage for active/no-active/stopped lifecycle as the highest independent P0 resume prerequisite available without inventing a playback provider.
- Opened PR #94. Exact-head CI/mergeability remains an acceptance gate.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- Resume checkpoint persistence into local history/Continue Watching is not yet wired; PR #94 only supplies the native-player boundary needed for it.
- No same-SHA four-platform Beta artifact/device matrix is proven and no Release was established in this run.
- Player advanced controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Re-read PR #94 exact head and Actions; fix failures from logs on the same branch and merge only when exact-head green + mergeable.
2. After merge, wire resume checkpoints into the local History/Continue Watching persistence path with integration tests.
3. Audit provider candidates/configuration for an actually authorized production playback integration; keep the blocker open if none exists.
4. Continue native-player buffering/error lifecycle and next/countdown prerequisites.
5. Build and inspect same-SHA platform artifacts only after the runtime path is sufficiently complete for meaningful Beta smoke.
