# Source Evidence Card: CineSpot-main

Status: DEEP_AUDIT_PARTIAL / DIRECT_REUSE_BLOCKED

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

## Remaining evidence
Inspect exact router/state flows, network service definitions, persistence schemas, player call sites, platform permissions, tests, telemetry behavior and asset provenance.
