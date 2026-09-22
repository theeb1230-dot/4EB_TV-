# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `164d59f1e9b662e939b58c0401fb36265f6b3434`.
- No open PR existed at run start.
- `main` is the verified merge of PR #92 and contains same-position source switching.
- Push CI on that exact `main`: `Audit hygiene` success and `Core contracts` success.
- No GitHub Releases exist yet.
- Current work branch: `player/retry-active-source`.
- This branch adds explicit same-source retry that reopens the active candidate at its current playback position, plus deterministic regression coverage. It is not counted as verified product completion until exact-head CI is green and the PR is merged.
- TVmaze remains production discovery/metadata only. It advertises no playback/download capability and remains separated from stream resolution.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Acceptance for current native-player slice
1. Retry is explicit and uses the currently active authorized candidate only; it does not discover, rewrite, proxy, or bypass media URLs.
2. Retry reads the active session position before disposal and reopens the same candidate at that position.
3. Failed initialization clears both active session and candidate state and remains retryable/fail-closed.
4. Calling retry without an active candidate fails closed without creating a session.
5. Existing same-position source switching behavior remains covered.
6. Exact-head CI must be green and the PR mergeable before merge.

## Blockers
### P0
1. Highest product blocker: no authorized production playback provider/path is proven. Do not invent, scrape around access controls, relay media, or turn TVmaze into playback. Integrate only a lawful authorized source behind `ProviderRegistry` / Resolver when one is actually available.
2. Prove Search -> Details -> Episodes -> Resolve -> Native Play with authorized data while preserving provider-local provenance and canonical metadata/stream separation.
3. Complete native player HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, buffering/error/retry, resume, same-position source switching/retry, next/countdown, PiP and platform-supported Cast/AirPlay.
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
| Native Player | 10 | 44% | 4.4 |
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

- **Overall Product Completion: 49.6%** on merged `main`; branch-only retry work is not added yet.
- **Current Phase Completion: 18%** for the active Native Playback/E2E phase.
- **Verified Functional Completion: 43%**.
- **Beta Readiness: 55%**; this is not a Beta usable claim because authorized playback E2E and same-SHA four-platform artifacts are still absent.
- The increase already present on `main` comes from merged, exact-head-green same-position source switching. Current branch retry work awaits CI/merge evidence.

## What does not work / is not proven
- No authorized production playback provider/path or E2E Search -> Details -> Episodes -> Resolve -> Native Play evidence is proven.
- No same-SHA four-platform Beta artifact/device matrix is proven and there are no Releases yet.
- Player advanced controls/platform evidence remain incomplete, including quality/audio/subtitle selection, next/countdown, PiP, Cast/AirPlay and runtime buffering UI evidence.
- Beta/Golden/Production are not yet usable claims.

## Next targets
1. Get exact-head CI green and merge the current native-player retry slice only when mergeable.
2. Audit current provider candidates/configuration for an actually authorized production playback integration; keep the blocker open if none exists.
3. Continue independent native-player prerequisites, prioritizing error/buffering lifecycle and resume persistence, then next/countdown.
4. Complete local Favorites/History/Continue Watching.
5. Build and inspect same-SHA platform artifacts only after the runtime path is sufficiently complete for meaningful Beta smoke.
