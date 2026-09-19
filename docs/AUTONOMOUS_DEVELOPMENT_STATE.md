# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact merged `main` at this execution is `224c69b1b0ead28c2caca1a4126ebfd6ab8fa368`.
- PR #50 exact head `e6015300de898010eb2f9056d147754567ba107b` passed Audit hygiene run `35460376266` and Core contracts run `35460376251`, including the provider-blind architecture gate and all seven package jobs, then merged with expected-head protection.
- Phase 1 remains ACCEPTED; Phase 2 is active and not yet accepted.
- Continuation branch is `architecture/phase2-experience-persistence`, created from exact merged main.
- Releases remain empty; release gates are intentionally not bypassed.

## Product invariants
ZERO_COST core, ZERO_ADS, Privacy First / Zero-PII, Native Playback First, internal WebView only as final fallback, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no 4BA/GitHub media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English and Turkish, real TV focus behavior, rollback-capable changes, evidence-backed completion claims.

## Architecture already merged
- `packages/core_domain`: canonical content/capability/playback/failure contracts.
- `packages/provider_sdk`: registry and fail-closed capability boundaries.
- `packages/capability_kernel`: deterministic provider-neutral routing, fail-closed admission/revocation, signed/versioned configuration contracts, rollback history and Experience capability facade.
- `packages/experience_contract`: provider-blind Experience descriptors/context plus registry/preview/apply engine, with a CI-enforced ban on Provider SDK references.
- Resolver health/ranking and fallback orchestration.
- Metadata canonicalization/deduplication.
- Executable design tokens baseline.

## Phase 1 audit state
The 30-root Acceptance Ledger and SOURCE_MATRIX are mechanically reconciled. Provider-pending/direct-reuse-blocked sources remain disabled. Audit acceptance does not authorize any provider.

## CI integrity
- PR #50 exact head passed Audit hygiene and Core contracts before merge.
- Core contracts CI covers seven executable packages and the Experience provider-blind architecture gate.
- The new Experience-persistence branch requires fresh exact-head CI before merge.

## Work completed in this execution
- Re-read the sole open PR, exact base/head, mergeability and exact-head workflows/jobs before mutation.
- Verified PR #50 was clean: architecture gate plus format/analyze --fatal-infos/tests for all seven packages passed; merged with expected-head protection.
- Added provider-neutral `ExperienceSelectionStore` persistence port; no storage technology leaks into Experience contracts.
- Added persisted apply ordering so durable write must succeed before in-memory active Experience changes. Failed writes preserve active and preview state for safe retry/rollback.
- Added fail-closed restore: unknown or currently unsupported persisted Experience ids cannot replace the default active Experience.
- Added tests proving failed durable writes do not partially apply and unknown persisted selections fail closed.
- Favorites, history, settings and playback progress remain outside Experience selection persistence.
- No provider endpoint, credential, stream target, ad/tracking SDK, paid backend, proxy or DRM/access-control bypass was introduced.

## Risks / blockers
- Phase 2 is not yet accepted: dependency/import graph evidence must expand as platform shells and real presentation packages arrive.
- The persistence port is intentionally storage-agnostic; concrete local storage implementations and crash-consistency evidence remain future platform work.
- A production signature algorithm/key-storage implementation is intentionally not selected until platform compatibility/security evidence is recorded.
- Exact production color contrast remains to be measured on rendered Flutter/Web/TV surfaces.
- Android API 24 and iOS 15 remain provisional until player/persistence/network compatibility evidence is recorded.

## Highest-value next work
1. Require exact-head Core contracts + Audit hygiene on the Experience-persistence branch and fix any defect on the same branch.
2. Add explicit selection transaction/result semantics if CI/API review exposes ambiguity, then keep platform storage adapters outside the Experience package.
3. Define platform-owned signature verification/key-rotation ADR after compatibility evidence; never embed private keys or secrets.
4. Continue executable Design System integration and dependency/import graph evidence toward Phase 2 acceptance.
