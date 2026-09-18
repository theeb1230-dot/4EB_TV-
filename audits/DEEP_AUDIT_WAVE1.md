# Deep Audit Wave 1 — Evidence Boundary

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`

Projects: `aniyomi-main`, `AIOStreams-main`, `flixquest-main`, `aiometadata-dev`.

## What is verified
The repository evidence cards prove archive presence and top-level structure only. They identify:
- Aniyomi: Android/Kotlin/Gradle multi-module boundaries including domain/data/presentation/source APIs, macrobenchmark and i18n.
- AIOStreams: TypeScript/pnpm workspace with packages, configuration sample and container deployment files.
- FlixQuest: Flutter client with Android, tests, design references, Cast receiver and OpenAPI artifact.
- AIOMetadata: TypeScript app/backend split with addon/configure/data boundaries and environment configuration.

## What is NOT verified
Code-level behavior, exact dependency versions, license terms, provider implementations, network endpoints, player internals, secrets/telemetry scans, API contracts and minimum platform targets are not yet evidenced from source-file reads.

The connected Drive search returned no individual source trees or aggregate archive result in this run. Therefore this wave MUST NOT promote inventory inference into a completed Deep Audit and MUST NOT copy source code.

## Clean-room decisions pending source evidence
- Aniyomi concepts: source contract lifecycle, domain/data split, performance benchmarking.
- AIOStreams concepts: aggregation isolation, capability representation, failure containment.
- FlixQuest concepts: adaptive Flutter navigation, TV focus, Cast UX.
- AIOMetadata concepts: identifier mapping, normalization, metadata-provider separation.

All remain concepts-only until LICENSE and implementation files are read from the authoritative bundled snapshot or a provenance-matched upstream source.

## Gate
Phase 1 remains incomplete. Integration work must not claim these projects as audited or reusable. Secrets, credentials, DRM/paywall bypass behavior, ads/tracking and mandatory paid infrastructure remain excluded by constitution.


## Upstream comparison evidence (provenance match still pending)

Public upstream repositories were inspected only to narrow the audit. These findings MUST NOT be treated as proof that the bundled snapshots are identical.

### Aniyomi upstream
Candidate upstream: `aniyomiorg/aniyomi`.
- Current upstream module graph matches the bundle's high-level names: app, core, core-metadata, data, domain, i18n, macrobenchmark, presentation, source-api and source-local.
- Current upstream LICENSE is Apache-2.0.
- Current app manifest reports version 0.18.2.1 and contains explicit updater/build metadata plus ABI splits.
- Crash-report configuration fields are present as commented configuration hooks; 4BA MUST NOT inherit analytics/crash endpoints or credentials.
- Reuse status: concepts may be studied; direct code reuse remains blocked until the bundled snapshot is provenance-matched and notices/dependencies are audited.

### AIOStreams upstream
Candidate upstream: `Viren070/AIOStreams`.
- Current package manifest reports version 2.34.1, Node >=24, pnpm >=11 and an explicit packages/* workspace.
- License is AGPL-3.0-only. Direct incorporation into a differently licensed 4BA client would create strong copyleft obligations and is therefore NOT approved by this audit.
- Current manifest explicitly describes stream proxy/IP-restriction-bypass capabilities. Those behaviors are outside the 4BA constitution and are excluded.
- Reuse status: clean-room architecture concepts only: aggregation isolation, filtering/ranking pipeline, capability boundaries and failure containment.

### AIOMetadata upstream
Candidate upstream: `cedya77/aiometadata` dev branch.
- Current package manifest reports version 2.17.2, Node 24, TypeScript/Vite frontend/backend split and metadata-oriented dependencies.
- Critical license inconsistency: root LICENSE content is GPL-3.0 while package.json declares Apache-2.0. Until maintainers/source history resolves this mismatch, direct code reuse is BLOCKED.
- Dependencies indicate optional external metadata/artwork integrations and server persistence/cache choices; 4BA must preserve metadata/stream separation and ZERO_COST by keeping paid/API-key services optional.
- Reuse status: clean-room metadata concepts only until license/provenance resolution.

### FlixQuest upstream
Candidate upstream discovered as `BeamlakAschalew/flixquest`, and its public tree strongly resembles the bundle inventory (Flutter, android, assets, lib, new_designs, new_ui). GitHub file retrieval did not return readable LICENSE/pubspec content in this run, so dependency/license claims remain pending.

## Wave 1 risk decisions
- Aniyomi: MEDIUM until exact bundled revision and dependency/telemetry/player files are inspected.
- AIOStreams: HIGH for direct reuse due AGPL and constitution-excluded proxy/bypass behavior; clean-room concepts only.
- AIOMetadata: HIGH for direct reuse because LICENSE and package metadata disagree; clean-room concepts only.
- FlixQuest: MEDIUM/HIGH pending readable license, pubspec, player/network and TV-focus evidence.


## Authoritative bundled ZIP evidence — 2026-09-18

The connected Drive archive was successfully fetched as the authoritative 215,407,865-byte ZIP and inspected selectively without copying source implementation into 4BA. It contains 70,644 ZIP entries and the expected 30 source roots. This supersedes earlier statements that only inventory-level evidence was accessible.

### Aniyomi bundled snapshot
- 2,039 files.
- Bundled `LICENSE` Git blob SHA: `d9a10c0d8e868ebf8da0b3dc95bb0be634c34bfe` (Apache-2.0 text).
- Bundled `settings.gradle.kts` blob SHA: `1aff46be7d8bb3d53b2fe58299f42062b6a63ed5`; both LICENSE and settings hashes exactly match the inspected current upstream files.
- Bundled app version is `0.18.1.2`, while inspected upstream app is newer (`0.18.2.1`), so the bundle is not the current upstream head and implementation claims must use bundled files.
- Modules verified from the bundle: app, core-metadata, core/archive, core/common, data, domain, i18n, i18n-aniyomi, macrobenchmark, presentation-core, presentation-widget, source-api, source-local.
- Static keyword triage found player/subtitle/HLS/DASH-related code and WebView usage across the Android client. These are audit leads, not automatic reuse approval.
- 4BA destination: architecture/reference for source lifecycle, domain/data separation, benchmarking and TV/player research. Direct reuse requires file-level dependency/NOTICE review.

### AIOStreams bundled snapshot
- 1,068 files; bundled version `2.32.1`.
- Bundled `package.json` declares `MIT`, but bundled root `LICENSE` blob SHA `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7` contains GPL-3.0 text. This is a direct license-metadata conflict inside the authoritative snapshot.
- The package description itself states stream proxying and IP-restriction-bypass behavior. That behavior is constitution-excluded and MUST NOT be implemented.
- Workspace packages/core, frontend, server, docs and seanime-extensions are present.
- Static triage found analytics/session/config code and extensive stream/provider logic. No credential values were copied.
- 4BA destination: Reference/Engine concepts only. Direct source reuse is BLOCKED until the snapshot's license conflict is resolved.

### FlixQuest bundled snapshot
- 742 files; Flutter version `4.1.1+5`.
- Root `LICENSE` is GPL-3.0 text (same verified blob SHA `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7`).
- `pubspec.yaml` verifies a local `better_player_plus` path dependency plus Firebase Analytics/Auth/Core/Crashlytics/In-App Messaging/Messaging/Remote Config, Mixpanel and `unity_ads_plugin`.
- Those analytics, messaging and advertising dependencies are NOT reusable in 4BA under ZERO_ADS/Zero-PII. Firebase-backed mandatory runtime assumptions also cannot become a ZERO_COST core dependency.
- Bundle includes dedicated player tests for next-episode policy, buffering, completion detection, subtitle configuration and stream-intro behavior, plus Android offline stream download/player code and a Cast receiver.
- 4BA destination: Experience/Reference concepts for adaptive Flutter UX, player test cases, offline UX and Cast interaction. Direct code reuse is BLOCKED by GPL unless a compatible licensing decision is made; ad/tracking integrations remain excluded regardless.

### AIOMetadata bundled snapshot
- 298 files; bundled version `2.7.1`.
- Root `LICENSE` is GPL-3.0 text while bundled `package.json` declares `Apache-2.0`. This conflict exists in the authoritative snapshot itself, not merely current upstream.
- Package verifies Node 24, TypeScript/Vite frontend/backend split and metadata-provider focus. Environment/config and cache/database integration points exist.
- Static triage found request/analytics-style tracking modules as audit leads; 4BA must not inherit user-identifying telemetry.
- 4BA destination: Metadata Engine clean-room concepts for mapping, normalization, provider separation and cache boundaries. Direct source reuse is BLOCKED until licensing is resolved.

## Security triage note
Keyword scanning was used only to locate files for deeper review. Matches for words such as `token`, `secret`, `tracking`, `player` or `webview` are not themselves proof of a vulnerability, credential leak or advertising behavior. No secret values are recorded in this repository.
