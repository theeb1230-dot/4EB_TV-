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
