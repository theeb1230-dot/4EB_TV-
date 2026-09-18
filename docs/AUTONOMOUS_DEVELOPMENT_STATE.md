# 4BA Autonomous Development State

GitHub is the source of truth. This compact handoff never overrides newer repository state.

## Current source truth
- PR #10 and PR #11 are merged. Exact merged `main` at the start of the current Wave-3 work is `61d82d47102a790c0b979b38b4667334ed49847b`.
- Sole open PR at this run's source-truth check: **#12 `Audit: Phase 1 source closure wave 3`**, branch `audit/deep-wave3`, base `main`, base SHA `61d82d47102a790c0b979b38b4667334ed49847b`, exact head at start `568c46af96c49c057d2026aa771869f64324ec59`, mergeable=true.
- Exact-head Audit hygiene run `35348196599` on start head `568c46a...` completed `success`.
- No Releases were present at the checked baseline.
- This run continued on PR #12 only and did not create parallel audit/implementation work.

## Product constitution invariants
ZERO_COST core, ZERO_ADS, Privacy First / Zero-PII, Native Playback First, internal WebView only as final fallback, no external-browser playback, no DRM/paywall/access-control bypass, no secrets, no mandatory paid backend, no 4BA/GitHub media proxy, Metadata != Streams, Watch != Download, provider/UI separation, Arabic RTL default plus English and Turkish, real TV focus behavior, rollback-capable changes, evidence-backed completion claims.

## Architecture already merged
- `packages/core_domain`: canonical content/capability/playback/failure contracts.
- `packages/provider_sdk`: registry and fail-closed capability boundaries.
- Resolver health/ranking and fallback orchestration.
- Metadata canonicalization/deduplication.
These foundations remain authoritative and are not rewritten around source-project quirks.

## Phase 1 gate
The 30-root acceptance ledger remains the authority. A root closes only with evidence for provenance/version, architecture, license/reuse, dependencies, network/API/cost, secrets/privacy/telemetry/ads, player/provider behavior where applicable, migration destination/exclusion, and risks/clean-room boundary. Evidence-backed rejection/quarantine/exclusion counts as audit completion but never runtime admission.

### Audit-complete roots
- `ProxyFill-main`: `DEEP_AUDIT_COMPLETE / EXCLUDED_RUNTIME`.
- `CinemaPress-master`: `DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE_ONLY`.
- `Filmex-main`: `DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE_ONLY`.
- `cinemalist-official-master`: `DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE_ONLY / CLEAN_ROOM`.

### Cinemalist authoritative closure
- Authoritative ZIP root was directly inspected and decisive Git blob SHA-1 values matched the public `bisunajaime/cinemalist-official` master snapshot at commit `bc46abf74c09e35de475f356824c0b1756a9da88`:
  - `pubspec.yaml` `8e23c0a98937e1d57dfa05243fe70f50f44a423f`
  - `LICENSE.txt` `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7`
  - `lib/main.dart` `227d57b8e1bce39694cb1ecade7233aa7b8cabd9`
  - TMDB API client `6041c60e1a46fe3253aad524ca18ee7e3b27a834`
- Authoritative package is `cinemalist` version `2.0.0+200`; GPLv3 root license is now proven for the archived snapshot. Current 4BA migration decision is clean-room behavior/Experience reference only, not direct implementation reuse.
- TMDB client directly targets API v3 metadata endpoints. Metadata behavior stays separate from Streams/Providers and production TMDB use remains independently terms/authorization/attribution/key-management gated.
- Authoritative `main.dart` contains a non-empty hard-coded default TMDB API key in addition to compile-time environment loading. The value was deliberately not reproduced; embedded/default credentials are excluded from 4BA.
- Bounded authoritative code scan found no selected ad/analytics SDK signatures. The bundled privacy policy describes third-party Log Data that may include IP/device/OS/config/time information; that policy is not inherited under Zero-PII and is not treated as proof that every described telemetry path exists in the inspected Dart code.
- `youtube_player_flutter` is used for trailer-oriented playback and `url_launcher` can launch external URIs. Neither is promoted to the 4BA movie/episode Player; external-browser playback remains forbidden.
- File-backed local JSON storage via `path_provider` is retained only as a clean-room local-first concept; canonical storage remains Core-owned.
- No authoritative Flutter test files were found in the expected test structure, and no TV focus/RTL/Turkish/offline/player-fallback/accessibility acceptance evidence is inherited.
- Updated the source card, Phase-1 Acceptance Ledger, SOURCE_MATRIX, EXPERIENCE_MATRIX, LICENSE_SECURITY_AUDIT and MIGRATION_PLAN consistently on PR #12.
- Commits produced during closure before this state update: `4ad66d6a2dca929972bdb3948eb69758b208f36e`, `9b232b8be0747629dc5ede96d86e3d932bbee5c6`, `22191a0d2ad3ff0cd9fab24606cea6c5a1249a08`, `6b2e9f355cf46416195e94263a166667345530e4`, `7b419b0552b89d0501b90713b4c9486c54f82267`, `9b783652d128d669e8308c5d0c011e2eee98184e`.

### Cinextma corroboration progress
- Start exact PR #12 head for this execution: `2b32e4116f015e5d0ed8d68d71e99bfdfa54fb13`; exact-head Audit hygiene run `35350082690` completed successfully with `repository-hygiene` green. Main remained `61d82d47102a790c0b979b38b4667334ed49847b`; PR #12 was sole open PR, mergeable=true; no Releases.
- Re-fetched the authoritative Drive ZIP (215,407,865 bytes). Direct selective ZIP reads for `cinextma-master` timed out again; this is recorded as infrastructure failure and no archive claim was invented.
- Identified matching public repository `wisnuwirayuda15/cinextma` and pinned corroborating master commit `0d939f089b5225d49da0edd684346530c5b9431d`.
- Public evidence narrows the remaining audit: MIT root license, package lock, Next.js/React/TypeScript, Supabase SSR/client, TMDB, PWA, Turnstile, Vercel Analytics and Speed Insights, plus placeholder Google-auth/SMTP environment examples.
- Product boundaries were strengthened immediately: Supabase/account/cloud is optional-only; Vercel analytics/speed telemetry is excluded under Zero-PII; TMDB remains Metadata and independently terms/key gated; no player/provider or source authorization is inferred.
- Updated the cinextma source card, LICENSE_SECURITY_AUDIT and MIGRATION_PLAN. Cinextma intentionally remains `DEEP_AUDIT_PARTIAL / EXPERIENCE_REFERENCE` until authoritative blob/security/player/test/asset evidence closes.
- First resulting evidence commit: `527560ce9619207995f33d198de1f2cba996927f`.

### Exact-head verification after cinextma boundary update
- Re-read GitHub after the previous cinextma evidence commits. Exact PR #12 head at this execution start was `b88f2ff7746c3255ef5253006c593ce586380e55`; GitHub now reports mergeable=true.
- Exact-head Audit hygiene run `35352545678` completed `success`; check `repository-hygiene` is green on that exact SHA. This supersedes the earlier transient mergeability/CI uncertainty.
- Re-fetched the authoritative Drive ZIP again. A fresh selective archive listing attempt for `cinextma-master` timed out at the container transport layer before yielding file evidence. No bundle provenance/license/player/security claim was inferred from the timeout.
- This is now a repeated infrastructure limitation, so the audit remains fail-closed and the next useful step is to close other roots with directly retrievable authoritative/public blob evidence rather than repeatedly burning runs on the same archive operation.
- No Releases exist and no conflicting PR/branch was created.

### Next audit target selected
- After recording the repeated cinextma archive-read limitation, inspected the existing `CineSpot-main` evidence card as the next high-value small Experience root.
- Current authoritative evidence already proves 479 files, Flutter 0.1.0 / Dart ^3.9.2, no root license in the bundle, Firebase/Auth/Firestore/Google Sign-In, Dio/Retrofit, YouTube, url_launcher and WebView dependencies, plus bundled Google services configuration whose values are intentionally not recorded.
- A GitHub repository search did not return a sufficiently attributable public CineSpot source from the available evidence, so no public repository was guessed or used as provenance. Direct reuse remains blocked and the next CineSpot work must come from authoritative file evidence or an exact provenance match.
- This preserves the fail-closed license/security rule rather than treating a similarly named repository as evidence.

## Current Phase 1 decision
**NOT ACCEPTED.** Four roots are evidence-complete. Remaining roots still have unresolved evidence cells. No source/provider/Experience is promoted merely because its audit closed.

## Highest-value next work
1. Continue on sole open PR #12 while it remains open; do not create conflicting audit or implementation PRs.
2. Close the next small Experience roots with authoritative file evidence, prioritizing `cinextma-master`, `CineSpot-main`, then remaining `Cinemax-main` cells.
3. Close Wave-1 dependency/network/privacy evidence for Aniyomi, AIOStreams, FlixQuest and AIOMetadata without copying incompatible code.
4. Close Anthology and Al-Qahtani provenance/config/network/security boundaries.
5. Keep authorization separate from technical playability for provider/live/addon roots.
6. Reconcile any root promoted to complete into Acceptance Ledger and all affected matrices/audits in the same PR.
7. Do not begin Phase-2/Player/UI implementation merely because individual roots close; Phase 1 requires all 30 roots to satisfy the acceptance criteria or evidence-backed rejection/exclusion.

## Repository hygiene / CI
`.github/workflows/audit-hygiene.yml` blocks committed third-party archives/build binaries and oversized tracked files. Start-head run `35348196599` was green. The resulting exact PR head after this state update requires its own CI result before it may be called green.

## Platform baselines
Android API 24 and iOS 15 remain provisional until selected player/platform dependency compatibility evidence is complete.
