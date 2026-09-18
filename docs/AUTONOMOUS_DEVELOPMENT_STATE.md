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

## Acceptance-ledger integrity repair

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; source-truth PR #10 head at start was `327d61b3ad8937bf005d9e9289700ebc8d118092`, sole open PR, mergeable=true. No Releases, workflow runs or check-runs existed for that exact docs head.
- Detected a real Phase-1 accounting defect: PHASE1_ACCEPTANCE_LEDGER claimed exactly one row for each of 30 authoritative roots but mechanically contained only 29 rows. `ARB-S33-3` was missing despite having an evidence card/provider classification.
- Restored the missing ARB-S33-3 ledger row as Provider/Reference with Node/Stremio evidence, per-source behavior/config still pending and production blocked pending authorization.
- Re-read the updated ledger mechanically: 30 rows, 30 unique source names, zero duplicates. This repairs audit-accountability coverage without promoting any source or inventing evidence.
- Authoritative Drive archive was also re-fetched by exact file ID in this run (215,407,865 bytes) for continued file-level work; local central-directory inspection hit an execution-environment timeout, so no unsupported file-content claim was added.
- Phase 1 remains NOT ACCEPTED. The next evidence work remains file-level license/provenance/dependency/network/secrets/ads/player/test closure, not additional generic governance prose.

## Exact-head source-truth and archive-read failure classification

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `378afcf63e88eef01e431e8dfe77bf7e994a5ed4`, sole open PR, mergeable=true. Branch inventory was re-read; no Releases, exact-head workflow runs or check-runs exist.
- Re-attempted direct file-level inspection of CinemaPress from the authoritative 215,407,865-byte Drive ZIP using a bounded project-root query. The execution environment again timed out while opening/reading the ZIP central directory, so the failure is classified as tooling/archive-read infrastructure rather than source evidence.
- No CinemaPress license, dependency, route, auth, test, secret, ad/tracking or persistence claim was promoted from the failed read. Its existing DEEP_AUDIT_PARTIAL / REFERENCE_ONLY state remains fail-closed.
- The acceptance ledger remains mechanically reconciled at 30 unique authoritative roots after the prior repair; no source was promoted or removed in this run.
- Phase 1 remains NOT ACCEPTED. File-level evidence closure remains the highest-value work; archive access failures must not be converted into guessed audit facts.

## Repository hygiene remediation

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `e34ba49944f9839e28c790392320da22719e7615`, sole open PR, mergeable=true. No Releases, exact-head workflow runs or check-runs.
- Repository-root inspection found `CinemaPress-master.zip` committed directly on the audit branch (24,121,537 bytes). This contradicted the clean-room rule that third-party implementation archives are evidence inputs, not 4BA product source artifacts.
- Added the finding to the CinemaPress evidence card, then removed the raw third-party ZIP from `audit/deep-wave1` in commit `63e342754569cd78f8552846799c3f76a7453cdc`. Evidence notes remain; the archive itself is no longer present at branch root.
- This removal does not claim license clearance and does not promote CinemaPress. It reduces redistribution/repository-hygiene risk while preserving the fail-closed REFERENCE_ONLY decision.
- Phase 1 remains NOT ACCEPTED; file-level evidence closure remains outstanding.

## Repository-hygiene regression gate

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `bfec73d799a67959d7e7bda45e7e13a517577328`, sole open PR, mergeable=true. No Releases, exact-head workflow runs or check-runs existed at inspection time.
- Recursively inspected the current PR tree: 106 tracked entries and no remaining ZIP/APK/IPA/AAB/EXE/DLL/JAR/WAR/7z/RAR artifact or tracked file above 5 MiB after the CinemaPress archive removal.
- Added `.github/workflows/audit-hygiene.yml` so future PR/push validation fails if raw archives/build binaries are committed or any tracked file exceeds the 5 MiB audit/product-source ceiling.
- The gate is intentionally repository hygiene only; it does not treat a passing file-size/archive check as license/security/provider approval.
- A fresh exact-head Actions run is required before claiming this new gate green. Phase 1 remains NOT ACCEPTED.

## Hygiene CI exact-head verification and correction

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `90831fe1ec01ba2deefb28adea796c8873e1d4d0`, sole open PR, mergeable=true; no Releases.
- The newly introduced Audit hygiene workflow actually executed on exact head: run `35294971889` completed success and repository-hygiene check passed. A second check-suite instance on the same SHA also passed.
- Review found a mismatch between the documented blocked-artifact set and the workflow regex: documentation/tree inspection included JAR while CI did not. Corrected the workflow to block `.jar` as well in commit `0f910f806c0e7a0449a9703a8a14c845eb5ed306`.
- Because that correction changes the exact head, the previous green run is evidence for `90831fe...` only. The corrected head requires its own Actions result before it can be called green.
- Phase 1 remains NOT ACCEPTED; no source/provider/Experience was promoted.

## Hygiene CI exact-head closure and duplicate-run fix

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `05b127b93886e9138128d04300ed121ac17e71f4`, sole open PR, mergeable=true; no Releases.
- Corrected JAR-aware hygiene gate is now proven on exact head: Audit hygiene run `35295127955` completed success; repository-hygiene check completed success. A second success check on the same SHA exposed duplicate execution from overlapping push + pull_request triggers.
- Reduced CI waste without weakening coverage: pull_request is now scoped to base `main`, while push continues to cover `main` and `audit/**`. This preserves PR validation and branch validation but prevents unrelated PR targets from triggering the workflow; duplicate events for audit PR updates remain observable and will be revisited if GitHub continues emitting both required contexts.
- No product/provider/source classification changed. Phase 1 remains NOT ACCEPTED.

## Duplicate CI trigger root-cause fix

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `81095d077efb27072a296f8ff6e5222ee59bf699`, sole open PR, mergeable=true; no Releases.
- Exact-head Audit hygiene run `35296304712` on `81095d0...` completed success, but two repository-hygiene checks were still emitted for the same PR update.
- Root cause: the audit branch update matched both `push: audit/**` and `pull_request: main`. The prior scoping reduced unrelated PR triggers but did not eliminate duplicate runs for audit PRs.
- Fixed the trigger model in commit `9ba055c34757fcf4482142dc5d0e175d1e2339ec`: PR validation remains on pull requests targeting `main`; push validation is now limited to `main`. This preserves branch-after-merge protection and exact PR validation without double-running on every audit branch push.
- Verified `docs/SOURCE_MATRIX.md` exists and already contains all 30 authoritative roots; no duplicate replacement file was created. The Acceptance Ledger remains the Phase 1 completion authority.
- No source/provider/Experience classification changed. Phase 1 remains NOT ACCEPTED.

## ProxyFill evidence closure progress

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start: `8198aa2cd5872d0481b5c50fe0d6b090b25035b0`, sole open PR, mergeable=true; no Releases.
- The duplicate CI trigger fix is now proven: exact-head Audit hygiene run `35298624700` completed success and only one `repository-hygiene` check exists on `8198aa2...`.
- Highest-value Phase-1 work then moved back to source evidence. Public `hfip/ProxyFill` was inspected as corroborating evidence only, not as a substitute for the authoritative archived snapshot.
- Corroborating code confirms Blazor WebAssembly/.NET, Pokémon proxy-card printing scope, Selenium/PDF/UI dependencies, a Pokémon API service, and a hard-coded API credential. The credential value was deliberately not copied into any 4BA document or commit.
- Updated `audits/sources/ProxyFill-main.md`, the Phase-1 Acceptance Ledger, and `docs/LICENSE_SECURITY_AUDIT.md`. Runtime remains EXCLUDED; the audit is not yet complete because bundle-local blob/provenance/license matching is still pending.
- No source/provider/Experience was promoted. Phase 1 remains NOT ACCEPTED.

## ProxyFill exclusion evidence strengthened

- Start main SHA: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`; PR #10 exact head at start of this run: `ec15aba34edc35b3f5668c157798fa205437a9de`, sole open PR and mergeable=true; no Releases and no exact-head checks at start.
- Continued Phase-1 evidence closure instead of creating unrelated implementation work.
- Pinned corroborating `hfip/ProxyFill` evidence to public commit `1a49d164d10aa24ae5ef57b6a275758500310bae` and recorded exact blob hashes for README, root project manifest, Program.cs, shared project manifest and Pokémon API service.
- Verified the public project manifest declares Blazor WebAssembly plus concrete AutoMapper/MudBlazor/Selenium/Syncfusion dependencies and references a bundled Pokémon SDK DLL. These remain corroborating until authoritative bundle blob matching closes provenance.
- Verified two concrete secret-handling failures in the corroborating source without copying secret material into 4BA: a hard-coded API credential exists in the service implementation, and `wwwroot/credentials.json` is configured with `CopyToOutputDirectory=Always`, which would ship a credentials file into client output. Secret contents/values were deliberately not reproduced.
- Updated the ProxyFill source card, Phase-1 Acceptance Ledger and LICENSE_SECURITY_AUDIT consistently. Runtime remains EXCLUDED and no 4BA capability/provider/Experience was promoted.
- Authoritative bundle matching and bundle-local root license/provenance remain open, so ProxyFill is not yet Phase-1 complete despite stronger exclusion evidence.
- Resulting branch head before this state update: `2f0e3faa1e511a2745f027eb6572e7f91451ecd0`.

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