## Capability-boundary reconciliation

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start was `b1e95353b37bb721742667ebee69509ab6eded8a`, sole open PR and mergeable=true. No Releases and no exact-head Actions runs.
- Expanded CAPABILITY_MATRIX from source mapping into explicit ownership/invariant contracts for Catalog/Search, Metadata, Stream, Download, Subtitle, Live, EPG, Health, Experience and optional Sync.
- Formalized Watch/Download separation so a Stream capability can never silently authorize or generate Download behavior.
- Formalized Metadata/Stream separation so canonical identity and user state survive provider outage/revocation and never use ephemeral stream/provider IDs as primary keys.
- Formalized Live/EPG separation so schedule metadata remains canonical independently of stream availability/authorization.
- Hardened Advanced Sources/Developer Mode boundary: provider labels and safe health evidence may be exposed, but credentials, tokens, private headers, cookies and secret-bearing URLs may not.
- Phase 1 remains NOT ACCEPTED; this reconciliation closes a matrix-consistency gap but does not substitute for remaining file-level source evidence.

## Canonical source-matrix reconciliation

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start was `872b934fdcc70760ae7806cfd12a2317063cc7e2`, sole open PR and mergeable=true. No Releases and no exact-head Actions runs.
- Reconciled the stale SOURCE_MATRIX, which still labeled all 30 roots as `Pending deep audit`, with the evidence already captured by source cards, Deep Audit waves and PHASE1_ACCEPTANCE_LEDGER.
- SOURCE_MATRIX now distinguishes PARTIAL evidence from production admission and records EXPERIENCE_REFERENCE, CONTRACT_REFERENCE, PROVIDER_PENDING, direct-reuse BLOCKED, QUARANTINED and EXCLUDED_RUNTIME states without falsely declaring any root fully audited.
- Corrected current classifications for outliers and architecture references, including ProxyFill as Unrelated/Reference + EXCLUDED_RUNTIME, CinemaPress as Engine/Reference, Al-Qahtani as Provider/Engine/Reference, and addon/live families as authorization-gated Provider references.
- Added explicit status semantics and reinforced that working URLs, public repositories, successful playback, addon compatibility or package-level license declarations cannot promote production admission.
- Phase 1 remains NOT ACCEPTED. No provider or third-party Experience was enabled and no implementation/secrets were copied.

## Risks / blockers

- Multiple roots still have unresolved root-license/provenance, dependency, network/API authorization, secret/config, ads/tracking, player/provider or asset/data-provenance evidence as recorded in `audits/PHASE1_ACCEPTANCE_LEDGER.md`.
- Secret/config samples must continue to be inspected without reproducing values.
- No source with unresolved authorization may be promoted to production merely because its endpoint/addon is technically reachable.
- This PR is documentation/audit-only at the current head, so there is no exact-head Actions run to claim; existing executable package CI evidence belongs to previously merged implementation PRs.
- Android API 24 and iOS 15 remain provisional pending compatibility evidence from eventual player/platform dependency selection.

## Next highest-value work

1. Continue on PR #10 and close remaining Phase-1 ledger cells with authoritative file-level evidence, prioritizing root license/provenance and dependency/config/network evidence that can convert `P` into verified or evidence-backed rejected states.
2. Reconcile each updated source card back into SOURCE_MATRIX, EXPERIENCE_MATRIX, PROVIDER_MATRIX, CAPABILITY_MATRIX, LICENSE_SECURITY_AUDIT and MIGRATION_PLAN in the same change so central documents cannot drift again.
3. Do not enable Providers or Experiences during audit closure; technical playability is not authorization.
4. Close Phase 1 only when every root satisfies the nine acceptance criteria or has an evidence-backed rejection/exclusion.
5. After Phase 1 acceptance, freeze the evidence-informed MASTER_ARCHITECTURE/ADRs and resume executable implementation in declared phase order.
6. Preserve existing core/provider/resolver/metadata packages and their previously green CI evidence; do not rewrite working foundations merely to accommodate a source project.

## Permanent gates

ZERO_COST, ZERO_ADS, Privacy/Zero-PII, Native Playback First, no external-browser playback, no secrets, license compliance, no DRM/paywall/access-control bypass, provider/UI separation, metadata/stream separation, watch/download separation, Arabic RTL + English + Turkish, real TV focus behavior, rollback-capable changes, and evidence-backed completion claims.