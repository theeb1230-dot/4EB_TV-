# Source Evidence Card: aniyomi-main

Status: INVENTORY_EVIDENCED / DEEP_AUDIT_PENDING

## Bundle evidence
The authoritative aggregate bundle contains an `aniyomi-main` tree. Low-level archive-string inspection confirms these top-level source/build areas: `app/`, `core/`, `core-metadata/`, `data/`, `domain/`, `source-api/`, `source-local/`, `presentation-core/`, `presentation-widget/`, `macrobenchmark/`, `i18n/`, `i18n-aniyomi/`, `buildSrc/`, `gradle/`, plus `build.gradle.kts`, `settings.gradle.kts`, `gradle.properties`, `README.md`, `CHANGELOG.md`, `LICENSE`, and GitHub/fastlane metadata.

## Evidence-backed interpretation
- Stack family: Android/Gradle/Kotlin-oriented multi-module project.
- Architecture signal: explicit domain/data/core/presentation/source boundaries.
- Source-extension signal: `source-api` and `source-local` deserve contract-level inspection before 4BA Provider SDK freeze.
- Performance signal: dedicated `macrobenchmark` module.
- Localization signal: dedicated i18n modules.

## 4BA relevance
Primary candidate: Engine / Experience / Reference. Highest-value concepts to inspect are source contracts, player boundaries, domain/data separation, extension lifecycle, migration strategy, performance testing, and Android UX patterns.

## Security/license gate
A LICENSE file is present in the bundle inventory, but its text has not yet been extracted in this audit. No code may be copied until license terms and source files are inspected. No credential values are recorded here.

## Next evidence required
Read LICENSE, settings/build manifests, source-api interfaces, player implementation, network stack, extension loading, persistence, tests, advertising/tracking references, Android minimum SDK, and dependency catalog. Then promote or reject each reusable concept explicitly.
