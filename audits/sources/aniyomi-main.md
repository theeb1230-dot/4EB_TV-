# Source Evidence Card: aniyomi-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / ANDROID_EXPERIENCE_REFERENCE / DIRECT_REUSE_DEFERRED

## Authoritative bundle evidence
The authoritative aggregate bundle contains `aniyomi-main` with `app/`, `core/`, `core-metadata/`, `data/`, `domain/`, `source-api/`, `source-local/`, presentation modules, macrobenchmark, i18n, Gradle/build logic, README/CHANGELOG/LICENSE and release metadata. The archived app version previously identified by the audit is 0.18.1.2.

Authoritative LICENSE/settings evidence is Apache-2.0 and the inspected settings topology matches the upstream module family. Public upstream commit `97414446b8a95994c72dd33c41c971a89d4d25b8` is used only as corroborating implementation evidence where the archive has not been blob-matched.

## Technology / architecture
Classification: **Engine + Android Experience + Reference**.
- Android/Kotlin/Gradle multi-module architecture with explicit domain/data/core/presentation/source boundaries.
- `source-api` is Kotlin Multiplatform and exposes source contracts separately from Android-specific implementation.
- SQLDelight/SQLite, OkHttp/Okio/Conscrypt, serialization, Jsoup, Coil and WorkManager are major runtime families.
- Dedicated macrobenchmark and profile tooling are useful performance references.
- Dedicated i18n modules are relevant to 4BA localization structure, but do not replace Arabic RTL / English / Turkish acceptance tests.

## Source / provider contracts
The source layer separates source discovery from hoster/video resolution. Version-correlated upstream evidence exposes `AnimeHttpSource` / `ParsedAnimeHttpSource`, hoster lists and video candidates. Player loaders operate on hoster/video state rather than binding presentation directly to one website.

4BA may study this contract shape, but owns its Provider SDK, canonical candidates, health ranking and authorization gates. Extension technical compatibility never proves content/source authorization.

## Player / download evidence
- App dependency evidence includes an internal mpv Android stack plus FFmpeg-related native libraries.
- Player loader evidence includes episode -> hoster -> video candidate handling and stateful loading.
- Download code separately resolves hosters/videos for download flows.
- External-player intent code exists upstream and is **not inherited** because 4BA requires Native Playback First and no external-browser/player dependency for normal playback.
- Torrent/TorrServer/native relay-like behavior is **excluded** from 4BA runtime.
- Compose WebView exists as an application dependency; it is not promoted to primary playback. 4BA keeps internal WebView as last-resort fallback only.

## Network / storage / permissions
- OkHttp/Okio/Conscrypt and HTML parsing establish a broad HTTP-capable source runtime.
- Android manifest evidence includes INTERNET, ACCESS_NETWORK_STATE and ACCESS_WIFI_STATE.
- Local persistence/cache concepts include SQLDelight/SQLite and disk cache.
- Broad source-network capability is not migrated wholesale. Each 4BA provider must declare bounded capabilities/hosts and pass authorization/security review.

## Privacy / ads / secrets
A bounded version-correlated search found no Firebase Analytics, Crashlytics, AdMob or common named advertising/analytics SDK evidence in the inspected upstream dependency/search surfaces. This is not a blanket privacy guarantee.
- Logcat/debug diagnostics are implementation details, not telemetry permission.
- Commented ACRA-style URI/login/password build fields exist in upstream build configuration; no value is copied and 4BA does not inherit credential-based crash reporting.
- Shizuku and broad Android integration are not Core requirements.
- No provider credentials, cookies, tokens, extension secrets or source-specific configuration are copied.

## License / dependency decision
Root license evidence is Apache-2.0, but root licensing alone does not clear every dependency, native library, extension, asset, trademark or provider. Upstream app packaging explicitly handles many third-party/native artifacts, so direct source/assets reuse remains **DEFERRED** until exact authoritative blob provenance and relevant NOTICE/dependency obligations are established for the specific files proposed for reuse.

Current migration modes:
- `CONTRACT_REFERENCE` for source/provider boundaries and loader state concepts.
- `ANDROID_EXPERIENCE_REFERENCE` for modular Android/performance/localization patterns.
- No source/provider implementation is admitted by this audit.
- No Aniyomi branding/assets are reused.

## Android compatibility evidence
Version-correlated upstream build logic currently sets minSdk 26, compile/target SDK 36 and Java/JVM 17. This **does not change 4BA's provisional API 24 baseline**. It is evidence that direct adoption of current upstream Android modules could raise the floor and therefore requires a separate compatibility decision. Clean-room contracts can remain API-24-compatible.

## 4BA migration destination
Useful independently owned destinations:
- source capability concepts -> `packages/provider_sdk`;
- hoster/video candidate state -> Resolver/Stream Aggregation contracts;
- domain/data/presentation separation -> Master Architecture reference;
- benchmark/profile strategy -> Android performance gates;
- localization structure -> Core localization, with 4BA language/RTL rules.

Explicit exclusions: torrent/TorrServer behavior, unapproved providers/extensions, external-player/browser playback, primary WebView playback, inherited credentials, source-specific secrets and any capability used to bypass access controls.

## Phase-1 closure
The audit is complete as an evidence-bounded reference decision. Apache-2.0 root evidence allows future file-specific reuse review, but **does not itself authorize wholesale copying**. Direct reuse is deferred; provider/runtime admission remains independently authorization-gated.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE + ANDROID_EXPERIENCE_REFERENCE. Direct reuse: DEFERRED. Provider admission: NOT GRANTED.**
