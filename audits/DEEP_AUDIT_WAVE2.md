# Deep Audit Wave 2 — Cinemax, CineSpot, Anthology, Al-Qahtani

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`
Authoritative source: connected 215,407,865-byte bundle. No third-party implementation code is imported by this audit.

## Cinemax
- 378 bundled files. Android/Kotlin/Gradle, Jetpack Compose, fully modularized.
- Root license: Apache-2.0.
- README documents official Android architecture guidance, custom dark-only design system, baseline profiles and a TMDB API key supplied through local.properties.
- Source tree verifies distinct core-network/core-database and feature modules; network movie/TV models, services, Room DAOs/entities and wishlist persistence are separated.
- Classification: **Experience + Reference**.
- 4BA extraction: modular feature boundaries, network/domain/database separation, dark design-system discipline, baseline-profile/performance methodology.
- Gate: TMDB/API credentials remain optional configuration and must never be committed. Dependency/telemetry/security review continues before direct reuse.

## CineSpot
- 479 bundled files. Flutter 0.1.0, Dart SDK ^3.9.2.
- pubspec verifies flutter_bloc/get_it, SharedPreferences, Dio/Retrofit and Firebase Core/Auth/Firestore. README documents authentication/social login and English/Arabic/French localization.
- Firebase-backed account/data behavior conflicts with 4BA's local-first/no-mandatory-login constitution if made foundational.
- Player/provider signals exist but require deeper file-level inspection.
- Classification: **Experience + Reference**.
- 4BA extraction: Flutter discovery/search/watchlist UX and localization patterns as clean-room/reference concepts. Authentication remains optional and cannot gate basic use.
- Gate: root license was not verified in the selected bundle pass, so direct reuse is blocked until license evidence is explicit.

## Anthology
- 2,900 bundled files; package version 1.7.28; package metadata declares MIT.
- Nuvio/Stremio-oriented Turkish movie/series/anime/live-TV addon repository.
- Package scripts verify addon, catalog, provider and playability test suites. Provider directory is substantial and the manifest/config model is provider-oriented.
- Classification: **Provider + Engine + Reference**.
- 4BA extraction: addon/provider registry concepts, manifest-driven capability discovery and provider/playability test methodology.
- Gate: each provider has its own authorization/terms/network risk. No provider implementation is automatically approved merely because the aggregator package declares MIT. DRM/paywall/access-control bypass remains excluded.

## Al-Qahtani
- 163 bundled files. Hybrid clean-room web + Node runtime + Flutter client.
- Flutter app version 1.0.33+33 uses http, path_provider, share_plus, SharedPreferences, video_player and webview_flutter.
- Node runtime requires Node >=22 and exposes extensive syntax/runtime tests for TMDB, fallback provider registry/runtime/probe and HLS manifest handling.
- README explicitly describes a clean-room continuation that removes advertising/legacy app coupling and prepares provider-based Flutter migration.
- Server fallback runtime verifies bounded opaque references, TTL expiry, provider ranking/probing, strict media classification, range handling and redirect rejection. It also contains direct-media relay behavior.
- Classification: **Provider + Engine + Experience/Reference**.
- 4BA extraction: provider registry/health/probe/failure taxonomy and migration documentation are valuable concepts.
- Hard architectural divergence: 4BA MUST NOT relay/proxy video through its own backend. Any Al-Qahtani direct-media relay/HLS proxy behavior is reference-only and excluded from 4BA runtime.
- WebView remains a final internal fallback only; legacy Android bridge behavior is not carried forward.

## Wave 2 decisions
1. Cinemax is the strongest Android modular/design/performance reference in this wave.
2. CineSpot is primarily a Flutter Experience reference; Firebase/account coupling is not foundational for 4BA.
3. Anthology is a Provider/Engine reference whose individual providers require separate authorization review.
4. Al-Qahtani contributes provider health/fallback concepts, but backend video relay is explicitly rejected by ZERO_COST/scalability/native-first architecture.

Phase 1 remains incomplete. Next audit surfaces: exact CineSpot player/network/license evidence, Cinemax dependency/security details, Anthology provider authorization matrix, and Al-Qahtani secret/network/legacy bridge scan.
