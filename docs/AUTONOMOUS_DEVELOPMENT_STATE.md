# 4BA Autonomous Development State

GitHub is the source of truth. This file is a compact handoff summary and must never override newer repository state.

## Current source truth
- PR #10 was squash-merged into `main` at `9404e1e2ec8bc8e22f050c4e3d0ac1f91a7d44c2` on 2026-09-18.
- PR #10 included the authoritative Filmex source card, Acceptance Ledger reconciliation, SOURCE_MATRIX update and EXPERIENCE_MATRIX decision through head `61550d07c5a8fcac989d1d9d8d3e1b59adc5060c`.
- No PR was open after #10 merged, so a clean continuation branch `audit/deep-wave2` was created directly from `main` at `9404e1e2...` to carry the remaining post-merge Filmex reconciliation without mixing squash history.
- On `audit/deep-wave2`, LICENSE_SECURITY_AUDIT and MIGRATION_PLAN now carry the Filmex closure evidence. Resulting head before this state update: `c6d308e8b1645a4549e23f14b40726879d89d782`.
- No Releases existed at the start of this continuation.

## Product constitution invariants
ZERO_COST for core functionality, ZERO_ADS, Privacy First / Zero-PII, Native Playback First, internal WebView as final fallback only, no external-browser playback, no DRM/paywall/access-control bypass, no secrets in the public repository, no mandatory paid backend, no 4BA/GitHub media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English and Turkish, true TV focus behavior, rollback-capable changes, and evidence-backed completion claims.

## Architecture already merged
Existing merged foundations remain authoritative:
- `packages/core_domain` canonical content/capability/playback/failure contracts.
- `packages/provider_sdk` provider registry and fail-closed capability boundaries.
- resolver health/ranking and fallback orchestration.
- metadata canonicalization/deduplication.
These are preserved rather than rewritten around source-project quirks.

## Phase 1 corpus and gate
The authoritative Drive ZIP is file ID `1ZRjuUdB3lctpsMfFTgVIiipaXoRtuldl`, size 215,407,865 bytes. It contains the 30 tracked source roots.

A root is Phase-1 complete only when evidence covers provenance/version, architecture, license/reuse, dependencies, network/API/cost, secrets/privacy/telemetry/ads, player/provider behavior where applicable, migration destination/exclusion, and risks/clean-room boundary. Evidence-backed rejection/quarantine/exclusion counts as audit completion but never as runtime admission.

## Audit-complete roots
### ProxyFill-main
`DEEP_AUDIT_COMPLETE / EXCLUDED_RUNTIME`
- Authoritative snapshot matched decisive public blobs.
- No bundle LICENSE/NOTICE; reuse fails closed.
- Hard-coded credential and unsafe credential-output behavior proven without recording secret values.
- Runtime is unrelated to 4BA and remains excluded.

### CinemaPress-master
`DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE_ONLY`
- Authoritative decisive blobs match public CinemaPress master; version 5.0.0 and root MIT verified.
- CMS/backend runtime, embedded/default credentials, IP/WHOIS/geolocation/cookies, ads/prebid, and server/embed/iframe/CinemaPlayer runtime are excluded.

### Filmex-main
`DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE_ONLY`
- Authoritative root inspected directly; package `moviehub`, version `1.0.0+1`, Dart `^3.9.0`, pubspec lock present.
- No LICENSE/NOTICE/COPYING file; direct code/assets reuse blocked fail-closed.
- Firebase Core/Auth/Firestore/Storage and Google Sign-In are coupled to startup/account/list/admin flows; mandatory cloud/account coupling is excluded from 4BA Core/local mode.
- `google_mobile_ads` plus Android AdMob configuration are present and excluded under ZERO_ADS.
- Actual playback is WebView/Google-Drive-preview oriented with unrestricted JavaScript and Android third-party cookies. `video_player` is declared but no `VideoPlayer` use was found in the bounded Dart scan.
- WebView-first playback is excluded under Native Playback First; only clean-room UX/layout ideas may inform 4BA Design System behind canonical contracts.
- Existing widget test is a stale default counter test and is not meaningful feature coverage.

## Audit/accounting integrity
- `docs/SOURCE_MATRIX.md` tracks exactly 30 authoritative roots.
- `audits/PHASE1_ACCEPTANCE_LEDGER.md` has one row per root and now correctly marks ProxyFill and Filmex audit-complete.
- Filmex source card, ledger, SOURCE_MATRIX and EXPERIENCE_MATRIX were merged in PR #10.
- `audit/deep-wave2` carries the remaining Filmex LICENSE_SECURITY_AUDIT and MIGRATION_PLAN reconciliation after the squash merge race.
- No Provider or third-party Experience has been promoted to enabled/eligible runtime status.

## Current Phase 1 decision
**NOT ACCEPTED.** Three roots are evidence-complete; remaining PARTIAL roots still have unresolved evidence cells.

## Highest-value next work
1. Keep work on the sole continuation PR/branch once opened from `audit/deep-wave2`.
2. Close small Experience roots next from the authoritative archive, prioritizing `cinemalist-official-master`, `cinextma-master`, `CineSpot-main`, then `Cinemax-main`.
3. Close remaining Wave-1 dependency/network/privacy evidence for Aniyomi, AIOStreams, FlixQuest and AIOMetadata without copying incompatible code.
4. Close Anthology and Al-Qahtani provenance/config/network/security boundaries.
5. Continue Turkish/provider/live/addon roots with authorization as a separate gate; technical playability is never authorization.
6. Reconcile every source-card change into Acceptance Ledger, SOURCE_MATRIX and relevant Experience/Provider/Capability/License/Migration documents in the same PR.
7. Do not declare Phase 1 complete until all 30 roots satisfy the nine evidence criteria or have evidence-backed reject/quarantine/exclusion decisions.

## Repository hygiene / CI
`.github/workflows/audit-hygiene.yml` blocks committed binary/archive artifacts and oversized tracked files. Exact-head CI must be rechecked after each write; an older green run never proves a newer SHA green.

## Platform baselines
Android API 24 and iOS 15 remain provisional until compatibility evidence from selected player/platform dependencies is complete.
