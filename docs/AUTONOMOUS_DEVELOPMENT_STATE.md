# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact merged `main` at this execution is `51c5bf5df0d1bc0695bb782e435974e3371e1370`.
- PR #48 exact head `752d2be5157fc4c64a64ceaa7c9fb2177a4fc771` passed Audit hygiene run `35450660852` and Core contracts run `35450660917`, then merged with expected-head protection.
- Phase 1 remains ACCEPTED; Phase 2 is active and not yet accepted.
- Continuation branch is `architecture/phase2-experience-contract`, created from exact merged main.
- Releases remain empty; release gates are intentionally not bypassed.

## Product invariants
ZERO_COST core, ZERO_ADS, Privacy First / Zero-PII, Native Playback First, internal WebView only as final fallback, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no 4BA/GitHub media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English and Turkish, real TV focus behavior, rollback-capable changes, evidence-backed completion claims.

## Architecture already merged
- `packages/core_domain`: canonical content/capability/playback/failure contracts.
- `packages/provider_sdk`: registry and fail-closed capability boundaries.
- `packages/capability_kernel`: deterministic provider-neutral routing, fail-closed admission/revocation, signed/versioned configuration contracts, rollback history and Experience capability facade.
- Resolver health/ranking and fallback orchestration.
- Metadata canonicalization/deduplication.
- Executable design tokens baseline.

## Phase 1 audit state
The 30-root Acceptance Ledger and SOURCE_MATRIX are mechanically reconciled. Provider-pending/direct-reuse-blocked sources remain disabled. Audit acceptance does not authorize any provider.

## CI integrity
- PR #48 exact head passed Audit hygiene and Core contracts before merge.
- Core contracts workflow is being extended to seven packages and an explicit Experience provider-blind architecture gate.
- The new Experience-contract branch requires fresh exact-head CI before merge.

## Work completed in this execution
- Re-read the sole open PR, exact base/head and exact-head workflows before mutation.
- Verified PR #48 was clean and both required workflows succeeded; merged it with expected-head protection.
- Added `packages/experience_contract`, depending only on Core, design tokens and the capability facade package; no Provider SDK dependency exists.
- Added provider-blind `ExperienceDescriptor` and `ExperienceContext` activation contracts plus a test proving capability removal immediately prevents activation.
- Added a CI architecture job that fails if the Experience contract contains a Provider SDK reference, and extended package CI to include `experience_contract`.
- Removed a duplicate capability-kernel path trigger and fixed missing push triggers while editing the workflow.
- No provider endpoint, credential, stream target, ad/tracking SDK, paid backend, proxy or DRM/access-control bypass was introduced.

## Risks / blockers
- Phase 2 is not yet accepted: dependency/import graph evidence must expand as actual Experience Engine and platform shells arrive.
- A production signature algorithm/key-storage implementation is intentionally not selected until platform compatibility/security evidence is recorded.
- Exact production color contrast remains to be measured on rendered Flutter/Web/TV surfaces.
- Android API 24 and iOS 15 remain provisional until player/persistence/network compatibility evidence is recorded.

## Highest-value next work
1. Require exact-head Core contracts + Audit hygiene on the Experience-contract branch and fix any defect on the same branch.
2. Introduce the Experience Engine registry/preview/apply state contract while preserving favorites/history/settings outside Experience state.
3. Define platform-owned signature verification/key-rotation ADR after compatibility evidence; never embed private keys or secrets.
4. Continue executable Design System integration and dependency/import graph evidence.
