# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact start `main`: `9b91f627318e15469f0d9cc8fcfab36fe9c37243`.
- Exact end `main` at this handoff update: `9b91f627318e15469f0d9cc8fcfab36fe9c37243` (unchanged because the selected PR is not yet exact-head green).
- Two PRs were found open at start, #81 and #82. This violates the one-PR operating rule. #81 is the older open P0 and is the only branch modified in this execution.
- Selected PR: #81 `app/discovery-locator-flow`. Code/test head before this state-only commit: `7038933626176eb91cb8da3fc9587f12df59773a`.
- #82 `player/runtime-state` remains untouched and must not be merged or modified until #81 is resolved.
- No Golden release is claimed.

## Product invariants
ZERO_COST core, ZERO_ADS/zero ad tracking, Privacy First/Zero-PII, Local-first, Native Playback First, internal WebView last fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no GitHub/4BA media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English/Turkish, evidence-backed completion only.

## Decision / blockers
- **P0 selected:** repair and complete the Search -> Details -> Seasons/Episodes provenance path in #81 before any other work.
  - Acceptance: search preserves provider-local locators; details/episodes receive those locators; state preserves them through resolve/play; canonical content remains provider-neutral; no provider secret/endpoint is introduced; exact-head CI must be green before merge.
  - Evidence required: app_flow tests + Flutter app-shell tests + architecture/audit checks on the exact PR head.
- **P0 next:** reconcile #82 only after #81 merges, then complete native player runtime controls and continue quality/audio/subtitles/resume/source-switch/PiP/platform integration.
- **P0 open:** authorized concrete discovery integration and real end-to-end Search -> Details -> Episodes -> Resolve -> Play runtime evidence.
- **P0 open:** remaining Core runtime config/security/network/cache/localization/accessibility/diagnostics and Design System runtime/device evidence.
- **P1:** Offline/downloads, Live/Sports/EPG, Experience switching, complete Android/TV/iOS/Web surfaces, local profile/history/favorites/continue-watching.
- **P2:** update channels, developer diagnostics, performance/accessibility hardening, Golden audits and release evidence.

## Work completed in this execution
- Re-read repository metadata, default branch, branches, open PRs, recent commits, current autonomous state, Product Constitution and Master Architecture.
- Inspected #81 and #82 exact heads and their Actions state rather than inheriting prior claims.
- Found #81 Core contracts failure at head `577e869ffa361258b0c80d01c862704d8e4ada46`.
- Read the failing job logs. Root cause was compile/analyze failure: `ProviderContentLocator` was referenced from `app_flow_controller.dart` without a visible type import.
- First attempted import from provider_sdk, then verified the type actually lives in app_flow's discovery coordinator and corrected the controller to reference the package-local discovery contract.
- Added a regression test proving provider-local locators survive Details -> Episodes -> episode selection -> Resolve/Play state transitions.
- Did not rerun failed jobs blindly; new commits trigger fresh exact-head workflows.
- Did not touch #82 while #81 is selected.

## Tests / CI / artifacts
- #81 old head `577e869...`: Audit hygiene SUCCESS; Core contracts FAILURE.
- Failure evidence: app_flow analyze and Flutter app-shell tests could not resolve `ProviderContentLocator`.
- Intermediate head `7b5d37e...`: Audit hygiene SUCCESS; Core contracts was running when superseded by the corrected code.
- Corrected code/test head before this handoff commit: `7038933626176eb91cb8da3fc9587f12df59773a`; fresh exact-head CI must complete before merge.
- No same-SHA Golden Android Mobile APK + Android TV APK + unsigned IPA + Web artifact set has been verified.

## Evidence-weighted scorecard, recomputed from current GitHub evidence
The score is intentionally conservative. Documentation alone is capped, and no runtime/device credit is granted where evidence is absent.

| Product area | Weight | Item completion | Weighted credit |
|---|---:|---:|---:|
| Governance + 30-source audit | 10% | 95% | 9.50 |
| Architecture/workspace | 7% | 85% | 5.95 |
| Design System | 6% | 55% | 3.30 |
| Core | 10% | 55% | 5.50 |
| Provider SDK/config | 6% | 50% | 3.00 |
| Metadata | 5% | 50% | 2.50 |
| Search/Resolver | 6% | 55% | 3.30 |
| Native Player | 10% | 40% | 4.00 |
| Experience + content UI | 8% | 35% | 2.80 |
| Live/Sports | 5% | 5% | 0.25 |
| Offline | 5% | 5% | 0.25 |
| Profile/local features | 3% | 10% | 0.30 |
| Android | 4% | 20% | 0.80 |
| Android TV | 4% | 15% | 0.60 |
| iOS | 4% | 15% | 0.60 |
| Web/PWA | 3% | 20% | 0.60 |
| Accessibility/updates | 2% | 15% | 0.30 |
| Security/performance/tests | 3% | 40% | 1.20 |
| CI/CD/releases | 2% | 20% | 0.40 |
| Beta/Golden hardening | 1% | 0% | 0.00 |

- **Overall Product Completion: 45.2%.**
- **Current Phase Completion: 68.0%** for the current P0 Search/Details/Episodes/Resolve/Play vertical slice.
- **Verified Functional Completion: 36.0%.**
- The recomputed overall percentage is not inherited from the previous 43.8%. It rises modestly because current main contains additional merged discovery/native-player work, but strict caps remain because there is still no authorized production catalog evidence, exact-head #81 is not yet green, device playback evidence is incomplete, and Golden artifacts do not exist.

## Open acceptance / risks
- #81 cannot merge until its newest exact head is green and mergeable.
- The repository currently has two open PRs; return to one open PR before new work.
- No authorized concrete discovery provider is proven in production runtime, so populated production search is not credited.
- Native player still lacks complete quality/audio/subtitle/local SRT-VTT/resume/source-switch/next-episode/PiP/Cast-AirPlay acceptance.
- API 24 and iOS 15 remain provisional pending compatibility/device evidence.
- No Golden claim until same-SHA artifacts, security/privacy/dependency/license audits, platform smoke, outage/rollback tests and Web load evidence are verified.

## Highest-value next work
1. Wait for and inspect #81 exact-head CI. If a CODE_DEFECT/TEST_DEFECT appears, fix it from logs on the same branch; when exact-head green and mergeable, merge with expected-head protection.
2. Re-read main after #81 merge and reconcile the remaining #82 PR against the new main before modifying it.
3. Continue the P0 real Search -> Details -> Episodes -> Resolve -> Native Play path using only authorized providers and add outage/fallback runtime evidence.
4. Complete native player acceptance and same-position fallback regression coverage.
5. Build and inspect same-SHA Android Mobile, Android TV, unsigned iOS and Web artifacts before any Golden claim.
