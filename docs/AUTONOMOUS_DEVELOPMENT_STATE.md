# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec`.
- Exact end `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec` (unchanged; PR #89 is not merged).
- PR #89 branch: `provider/tvmaze-discovery`.
- Start PR head: `b2c3273e5cc8441b7cab004b11a9030f46a9ceab`.
- Synchronization merge commit created in this run: `cf510b9189277bd08852dd54b35e578f7faf8179`, with parents `b2c3273e5cc8441b7cab004b11a9030f46a9ceab` and `main@6b0b8faf1773468319d3c9a9c4cb8162204decec`.
- The synchronization preserves the current `main` Cinematic Gold presentation implementation/tests while retaining the TVmaze discovery slice.
- GitHub reports PR #89 `mergeable=true`, `rebaseable=true`, `mergeable_state=unstable` after synchronization.
- Exact-head workflow runs had not appeared for `cf510b9189277bd08852dd54b35e578f7faf8179` at verification time, so the PR was not merged.
- This documentation commit advances the branch head again; re-read the exact head and exact-head CI before any merge.
- No Beta usable, Golden, or Production claim is made.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, Cinematic Gold dark-only V1, evidence-backed completion only.

## Run decision and acceptance
### P0 selected: close PR #89 production discovery
Acceptance criteria:
1. Default executable registry has at least one lawful, zero-secret metadata discovery source.
2. Provider remains behind `ProviderRegistry` / `ContentDiscoveryProvider`; presentation remains provider-blind.
3. Provider advertises metadata/catalog/search only and fails closed for stream/download resolution.
4. Search, details and episodes mapping have deterministic tests.
5. Architecture policy admits the concrete adapter boundary and CI runs its tests.
6. TVmaze CC BY-SA attribution/share-alike obligations are recorded and exposed through a reachable in-product legal/about surface.
7. PR exact head is CI green and mergeable before merge.

Closed/evidenced in PR #89:
- TVmaze adapter implements search/details/episodes and intentionally returns no playback/download source.
- Default app registry registers it without credentials or paid backend.
- Architecture policy and Core-contract matrix include `tvmaze_provider`.
- `docs/legal/TVMAZE_ATTRIBUTION.md` records attribution/share-alike obligations.
- Reachable `حول وحقوق البيانات` UI exposes TVmaze and CC BY-SA evidence with widget/navigation coverage.
- Branch divergence from `main` was removed structurally by a two-parent synchronization commit; current `main` presentation files were preserved.

Open acceptance:
- Exact-head Audit hygiene + Core contracts must run and be green on the current PR head. No blind rerun and no merge without this evidence.

## Blockers
### P0
1. PR #89 exact-head CI evidence. After the synchronization, GitHub reports the PR mergeable, but no exact-head workflow run was visible yet.
2. After #89 merges, prove an authorized Search -> Details -> Episodes -> Resolve -> Native Play path. TVmaze remains metadata-only and cannot satisfy playback.
3. Complete native player HLS/DASH/MP4 quality/audio/subtitles, local SRT/VTT, buffering/error/retry, resume, same-position source switching, next/countdown, PiP and platform-supported Cast/AirPlay with regression evidence.
4. Complete local Favorites + History + Continue Watching.
5. Produce same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, inspect artifacts, and collect platform/device smoke evidence.

### P1
- Downloads/offline queue, quality/audio/subtitles, season queue, quota/cleanup and cached library metadata.
- Authorized Live/Sports/EPG and mini-player.
- Experience Engine Preview/Apply while preserving local state.
- Single local profile, recommendations, feedback, Incognito, Collections, backup export/import and optional Zero-PII sync.

### P2
- Stable/Beta update discovery, Developer Mode, privacy-safe optional diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
| Product area | Weight | Verified item completion | Weighted points |
|---|---:|---:|---:|
| Governance + 30-source audit | 10 | 78% | 7.8 |
| Architecture/workspace | 7 | 80% | 5.6 |
| Design System | 6 | 78% | 4.7 |
| Core | 10 | 55% | 5.5 |
| Provider SDK/config | 6 | 55% | 3.3 |
| Metadata | 5 | 55% | 2.8 |
| Search/Resolver | 6 | 55% | 3.3 |
| Native Player | 10 | 40% | 4.0 |
| Experience + content UI | 8 | 45% | 3.6 |
| Live/Sports | 5 | 5% | 0.3 |
| Offline | 5 | 6% | 0.3 |
| Profile/local features | 3 | 15% | 0.5 |
| Android | 4 | 28% | 1.1 |
| Android TV | 4 | 24% | 1.0 |
| iOS | 4 | 28% | 1.1 |
| Web/PWA | 3 | 23% | 0.7 |
| Accessibility/updates | 2 | 30% | 0.6 |
| Security/performance/tests | 3 | 55% | 1.7 |
| CI/CD/releases | 2 | 20% | 0.4 |
| Beta/Golden hardening | 1 | 0% | 0.0 |

- **Overall Product Completion: 48.3%**. PR #89 remains excluded from merged production capability until exact-head CI is green and it reaches `main`.
- **Current Phase Completion: 91%** for Phase 3 Design System execution.
- **Verified Functional Completion: 40%** because runtime/platform evidence and authorized playback remain incomplete.
- **Beta Readiness: 52%**. This is not a Beta usable claim; authorized Resolve -> Native Play and same-SHA platform artifacts/smoke are still mandatory.
- Percentages remain unchanged this run because `main` did not change. The material progress was removal of the PR divergence/mergeability blocker.

## What does not work / is not proven
- No authorized production playback provider/path is proven.
- No end-to-end authorized Search -> Details -> Episodes -> Resolve -> Native Play evidence exists yet.
- No same-SHA four-platform Beta artifact/device matrix is proven.
- PR #89 still lacks exact-head green CI evidence after synchronization.

## Next targets
1. Re-read PR #89 exact head after this docs commit and inspect exact-head Actions/checks/logs. Merge only when green and mergeable, using expected-head protection.
2. Re-read `main` after merge and recalculate all four percentages from repository evidence.
3. Move immediately to the highest executable prerequisite for authorized Resolve -> Native Play; do not invent or bypass a playback source.
4. Continue native-player and local product-loop blockers while no authorized playback source can legally be integrated.
