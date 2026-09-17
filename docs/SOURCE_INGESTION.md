# 4BA Source Ingestion Protocol

## Purpose

The 30-source bundle is an input/reference corpus, not application runtime content. Binary archives must not be treated as audited merely because their filenames are known. Every source must become inspectable at file level before code reuse or architectural decisions are accepted.

## Authoritative bundle

Drive file ID: `1ZRjuUdB3lctpsMfFTgVIiipaXoRtuldl`
Name: `مشاريع مختلفه زايد مشروع القحطاني tv.zip`
Observed size: `215407865` bytes.

The repository currently also contains `CinemaPress-master.zip`; that binary is reference input and is not an executable 4BA workspace.

## Ingestion rules

1. Never commit secrets, cookies, tokens, credentials, session files, private keys, signing material, environment files containing secrets, or copied account data.
2. Never commit dependency/build caches (`node_modules`, Gradle caches, build outputs, Pods, generated binaries) merely to make a source inspectable.
3. Preserve provenance for every source: source name, bundle path, detected license, detected stack, and audit date/commit.
4. Prefer importing only source/config/license/test/documentation files required for audit, or store audit extracts/manifests rather than blindly copying an entire third-party tree.
5. A source cannot be marked `Audited` until its license, dependency manifests, entry points, provider/network boundaries, player behavior, advertising/tracking code, secrets risk, and reusable destination are evidenced.
6. Unknown/no-license code is not copied into 4BA production code. Concepts may be documented and independently reimplemented when lawful.
7. Provider implementations remain behind 4BA contracts. UI code never binds directly to a provider.
8. No DRM/paywall/access-control bypass behavior is imported or reproduced.
9. Remove/reject inherited advertising, popups and advertising tracking.
10. Binary archive presence is not an acceptance criterion. Inspectable evidence is.

## Audit priority

Architecture-critical first wave:

1. `aniyomi-main`
2. `AIOStreams-main`
3. `flixquest-main`
4. `aiometadata-dev`
5. `Cinemax-main`
6. `CineSpot-main`
7. `anthology-main`
8. `Al-Qahtani-main`
9. `turkish-series-main`
10. `xoxixoxi-main` and `Ytvplus2-main`

Then complete all remaining sources in `SOURCE_MATRIX.md`.

## Required outputs

- `audits/sources/<source>.md` evidence card for every source.
- `docs/EXPERIENCE_MATRIX.md`
- `docs/PROVIDER_MATRIX.md`
- `docs/CAPABILITY_MATRIX.md`
- `docs/LICENSE_SECURITY_AUDIT.md`
- `docs/MIGRATION_PLAN.md`

## Evidence card minimum

Each card records: provenance, stack/framework, repository/tree structure, architecture, entry points, UI/UX, data models, APIs/network calls, provider contracts, player implementation, storage/cache, localization, TV behavior, dependencies, tests/CI, advertising/tracking, secret/credential findings without reproducing secret values, license, reusable code status, clean-room concepts, 4BA destination, migration constraints, risks, and evidence paths.

## Security handling

When a suspected credential is discovered, record only its type/location and remediation status. Never copy the value into audit documents, issues, logs, commits, or PR comments. Treat the previously identified `orien.live-main` credential-finder material as quarantined/high-risk until inspected.

## Completion gate

Phase 1 is complete only when all 30 sources have evidence cards and the Experience/Provider/Capability/License-Security matrices are populated from those cards. Filename-level inventory alone does not satisfy the gate.
