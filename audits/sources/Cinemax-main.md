# Source Evidence Card: Cinemax-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / EXPERIENCE_REFERENCE / DIRECT_REUSE_DEFERRED

## Authoritative bundle evidence
- 378 files in the authoritative archive.
- Android/Kotlin/Jetpack Compose modular application.
- Root LICENSE verified as Apache-2.0 in the bundle.
- Version catalog verifies AndroidX Compose/Material3, Navigation, Lifecycle, Room, DataStore, Paging, Hilt, Kotlin coroutines/serialization/datetime, OkHttp, Retrofit, Coil, benchmark/profile installer, MockK/JUnit and Detekt/Spotless tooling.
- App manifest requests INTERNET and ACCESS_NETWORK_STATE.
- Benchmark module contains BaselineProfileGenerator and BaselineProfileBenchmark.
- Modules include core network/database/datastore/data/domain/model/UI/design-system/navigation and feature home/details/search/list/wishlist/settings.
- No player module was identified in the audited path evidence, so Cinemax is not treated as a playback-engine source.

## 4BA relevance
Classification: **Experience + Reference**.
Strong reference areas: modular Android feature boundaries, network/domain/database separation, Compose dark-design-system organization, Room/DataStore separation, baseline-profile/performance methodology.

## Security / constitution notes
- README/build evidence uses a TMDB API key via local.properties; no key value is copied. 4BA secrets must remain outside the public repository.
- Network access is explicit and should remain metadata/catalog-oriented unless separately authorized.
- Apache-2.0 root license improves reuse eligibility but does not by itself clear dependency NOTICE obligations, assets, API terms or provenance.

## Admission decision
Migration modes: **CONTRACT_REFERENCE + EXPERIENCE_REFERENCE**. Any LICENSED_REUSE promotion requires dependency/NOTICE/assets/API-term closure and tests. No player capability is inferred.

## Closure decision
The audit is complete by a fail-closed reuse decision. Apache-2.0 at the root establishes source-license evidence, but unresolved third-party NOTICE/assets/API-term provenance means direct implementation/assets are **not admitted**. The inspected tree provides no player module and no evidence sufficient to claim TV/D-pad behavior, so neither capability is inferred. TMDB/network behavior is metadata/catalog reference only and remains independently subject to API terms/key handling. Android API 24 is not frozen from this source because exact dependency/min-SDK compatibility is not established.

This evidence-backed deferral closes the Phase-1 question without pretending missing evidence is approval: Cinemax contributes architecture/design/performance concepts through clean-room/reference boundaries only.
