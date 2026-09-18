# Source Evidence Card: CineSpot-main

Status: DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- 479 files in the authoritative archive.
- Flutter app, version 0.1.0 / Dart SDK ^3.9.2.
- No root LICENSE/LICENSE.md/LICENSE.txt was present in the inspected bundle tree. Direct implementation/assets reuse therefore remains blocked unless provenance supplies compatible license evidence.
- pubspec dependencies verified: flutter_bloc, get_it, shared_preferences, Firebase Core/Auth/Firestore, Dio, Retrofit, pretty_dio_logger, cached_network_image/cache_manager, image_picker, YouTube player, Google Sign-In, url_launcher and webview_flutter.
- Android bundle contains google-services.json. Values are deliberately not recorded in 4BA audit docs.
- pubspec launcher configuration declares min_sdk_android 21; this is source evidence only and does not change 4BA's provisional API 24 baseline.

## 4BA relevance
Classification: **Experience + Reference**.
Useful clean-room concepts: Flutter discovery/search/watchlist flows, BLoC-style presentation boundaries, localization and cached artwork.

## Constitution conflicts / risks
- Firebase Auth/Firestore/Google Sign-In cannot become mandatory because 4BA local mode is default and account/sync are optional.
- url_launcher cannot be used to escape playback to an external browser.
- webview_flutter may only serve the internal final fallback, never primary playback.
- pretty_dio_logger requires release-safe redaction/disablement; request headers/tokens/PII must never be logged.
- Presence of google-services configuration confirms cloud coupling in this snapshot but is not a license or authorization grant.

## Admission decision
Migration mode: **EXPERIENCE_REFERENCE**. Direct code/assets reuse is blocked pending explicit license evidence. No Firebase account dependency, external-browser playback, tracking, or provider behavior is inherited into 4BA.

## Closure decision
The Phase-1 audit is complete by a fail-closed reuse decision. The authoritative snapshot establishes enough architecture/dependency/cloud/player-fallback risk evidence to decide migration safely, while the missing root license and unattributed provenance prohibit direct implementation/assets reuse. Unresolved router/service/test/asset details therefore cannot silently become runtime approval; they remain outside 4BA until independently evidenced.

4BA may clean-room reproduce only documented product behaviors such as discovery/search/watchlist, BLoC-style presentation separation, localization and artwork caching. Firebase account/cloud coupling, Google Sign-In, request logging, external-browser playback and WebView-first playback are not inherited. No provider or native-player capability is inferred from this source.
