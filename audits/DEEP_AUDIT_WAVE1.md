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
