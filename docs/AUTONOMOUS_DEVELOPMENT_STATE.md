# 4BA Autonomous Development State

GitHub is the source of truth. This handoff never overrides newer repository state.

## Current source truth
- Exact merged `main`: `b532f8b78e6175c30e30a21f27830e14eeb26449`.
- PR #13 (`audit/deep-wave4`) was merged by squash only after exact head `990da72e4cde5928f6f4dbba9d706566d5f93353` passed Audit hygiene run `35360049656`; `repository-hygiene` and the Phase-1 evidence-card integrity gate were green.
- Continuation branch: `audit/deep-wave5`, created exactly from merged main `b532f8b78e6175c30e30a21f27830e14eeb26449`.
- Phase 1 remains **NOT ACCEPTED**. Do not claim completion until all 30 roots satisfy the Acceptance Ledger.

## Product invariants
ZERO_COST core, ZERO_ADS, Privacy First / Zero-PII, Native Playback First, internal WebView only as final fallback, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no 4BA/GitHub media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English and Turkish, real TV focus behavior, rollback-capable changes, evidence-backed completion claims.

## Architecture already merged
- `packages/core_domain`: canonical content/capability/playback/failure contracts.
- `packages/provider_sdk`: registry and fail-closed capability boundaries.
- Resolver health/ranking and fallback orchestration.
- Metadata canonicalization/deduplication.
These foundations remain authoritative and are not rewritten around source-project quirks.

## Phase 1 audit state
The 30-root Acceptance Ledger remains the completion authority and `SOURCE_MATRIX` remains the canonical exact-root authority. A root closes only with evidence for provenance/version, architecture, license/reuse, dependencies, network/API/cost, secrets/privacy/telemetry/ads, player/provider behavior where applicable, migration destination/exclusion, and risks/clean-room boundary. Evidence-backed rejection/quarantine/exclusion can close an audit but never authorizes runtime admission.

Evidence-complete roots currently include `ProxyFill-main`, `CinemaPress-master`, `Filmex-main`, and `cinemalist-official-master`. AIOStreams has materially advanced but remains `DEEP_AUDIT_PARTIAL / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED` because authoritative blob/package/privacy/telemetry closure is still incomplete.

`cinextma-master` remains PARTIAL because authoritative selective archive reads previously timed out; public evidence is corroborating only until authoritative blobs match. `CineSpot-main` remains PARTIAL / DIRECT_REUSE_BLOCKED: authoritative inventory establishes Flutter/Firebase/Auth/Firestore/Google Sign-In/Dio/Retrofit/YouTube/url_launcher/WebView surfaces and bundled Google services configuration, but no root license was found and no attributable public provenance match was established. No credentials are recorded or inherited.

`Cinemax-main` remains `DEEP_AUDIT_PARTIAL / REFERENCE_ELIGIBLE`: authoritative evidence establishes Android/Kotlin/Compose modular architecture, Apache-2.0 root license, Room/DataStore/Hilt/network/design-system modules and baseline-profile tooling, but dependency/NOTICE/assets/API terms, exact SDK compatibility, telemetry/ads, TV/D-pad and network-contract closure remain outstanding. No player module was identified, so Cinemax is not admitted as a playback-engine source.

## CI integrity
- PR #13 exact head `990da72e4cde5928f6f4dbba9d706566d5f93353` passed Audit hygiene run `35360049656`.
- `repository-hygiene` passed checkout, third-party archive/build-binary rejection, oversized-file rejection, and Phase-1 evidence-card integrity.
- Merge used the exact expected-head SHA guard and produced `main` `b532f8b78e6175c30e30a21f27830e14eeb26449`.

## Highest-value next work
1. Continue Phase-1 closure on `audit/deep-wave5`; do not create conflicting feature branches while its PR is open.
2. Close `Cinemax-main` dependency/NOTICE/assets/API/network/privacy/telemetry/TV evidence from authoritative material when available.
3. Close `CineSpot-main` and `cinextma-master` with authoritative evidence; fail closed where provenance/license cannot be established.
4. Continue AIOStreams authoritative blob/privacy/telemetry closure without importing proxy/IP-bypass/torrent/debrid/media-relay behavior.
5. Close Wave-1 dependency/network/privacy evidence for Aniyomi, FlixQuest and AIOMetadata without copying incompatible code.
6. Reconcile every completed root into Acceptance Ledger and affected matrices/audits in the same PR.
7. Do not promote Providers/Experiences from technical playability alone; authorization, license, privacy and constitution gates remain independent.

## Platform baselines
Android API 24 and iOS 15 remain provisional until selected player/platform dependency compatibility evidence is complete.
