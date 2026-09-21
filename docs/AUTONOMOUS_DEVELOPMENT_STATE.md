# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `6b0b8faf1773468319d3c9a9c4cb8162204decec`.
- Exact end `main` for this run: `6b0b8faf1773468319d3c9a9c4cb8162204decec` (unchanged while PR #89 is under exact-head CI).
- PR #89 branch: `provider/tvmaze-discovery`. Pre-handoff exact head: `931687c699352008fb64970bc7584f49979c569c`; the handoff commit itself advances the branch head and must be re-read from GitHub before merge.
- PR #89 was reopened because there was no open PR and production discovery remains the highest executable P0 blocker. It is the only active work slice.
- No Golden release is claimed. Same-SHA Android Mobile, Android TV, unsigned iOS and Web artifacts plus device/runtime evidence remain unverified.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, evidence-backed completion only.

## Run decision and acceptance
### P0 selected: production discovery
Acceptance criteria:
1. Default executable registry has at least one lawful, zero-secret metadata discovery source.
2. Provider remains behind `ProviderRegistry` / `ContentDiscoveryProvider`; presentation remains provider-blind.
3. Provider advertises metadata/catalog/search only and fails closed for stream/download resolution.
4. Search, details and episodes mapping have deterministic tests.
5. Architecture policy explicitly admits the concrete adapter boundary and CI runs its tests.
6. No release may ship until CC BY-SA attribution/share-alike obligations are exposed appropriately in-product and recorded in release/legal evidence.

Evidence in PR #89:
- TVmaze adapter implements search/details/episodes and intentionally returns no playback/download source.
- Default app registry registers the adapter without credentials or paid backend.
- `tools/check_architecture.py` now admits `tvmaze_provider` only with Core + Provider SDK dependencies.
- Core-contract matrix now includes `tvmaze_provider` so its formatting/analyze/tests cannot silently escape CI.
- TVmaze public API is free and CC BY-SA; attribution/share-alike remains a release gate, not something to hand-wave away.

## Blockers
### P0
1. Get PR #89 exact-head Audit hygiene + Core contracts green and mergeable, then merge with expected-head protection.
2. Add in-product TVmaze attribution/link and license evidence before any distributable release using its data.
3. Prove an authorized Search -> Details -> Episodes -> Resolve -> Native Play path. TVmaze is metadata-only and is not a playback provider.
4. Complete native player quality/audio/subtitles, local SRT/VTT, resume, same-position source switching, next/countdown, PiP and platform-supported Cast/AirPlay with regression evidence.
5. Produce same-SHA/version Android Mobile APK + Android TV APK + unsigned IPA where permitted + Web artifact, inspect artifacts, and collect platform/device smoke evidence.

### P1
- Favorites/history/continue-watching and single local profile.
- Downloads/offline queue, quota/cleanup and cached library metadata.
- Authorized Live/Sports/EPG and mini-player.
- Android adaptive, TV 10-foot D-pad/focus, iOS integration and complete Web/PWA.

### P2
- Stable/Beta update discovery, Developer Mode, privacy-safe optional diagnostics, performance/accessibility hardening and Golden gates.

## Evidence-weighted progress using fixed product weights
The previous handoff's 68% aggregate is retired because it did not follow the fixed 100-point weighting requested for autonomous runs.

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

- **Overall Product Completion: 48.1%** by the fixed weighted calculation above. This is not Beta/Golden readiness.
- **Current Phase Completion: 91%** for Phase 3 Design System execution; runtime tokens/theme/focus/reduced-motion are integrated, while final contrast/device captures, complete navigation/player-control treatment and platform evidence remain open.
- **Verified Functional Completion: 40%**. This intentionally trails code/contract presence because runtime/platform evidence and an authorized playback vertical slice are not yet complete.
- Reason for recalculation: the fixed weighting exposes substantial unfinished Live/Offline/platform/release work that the older 68% handoff obscured. PR #89 is not counted as merged production capability until exact-head CI is green and it reaches `main`.

## Next targets
1. Finish PR #89 from CI logs, not blind reruns; merge only exact-head green and mergeable.
2. Re-read `main` after merge and add in-product attribution/legal evidence before a release can consume TVmaze data.
3. Continue the highest P0 vertical slice toward authorized Resolve -> Native Play and player failure/source-switch regression tests.
4. Do not spend the next slice on cosmetic refactoring while these functional blockers remain.
