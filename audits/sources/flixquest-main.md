# Source Evidence Card: flixquest-main

Status: DEEP_AUDIT_PARTIAL / EXPERIENCE_REFERENCE / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- 742 files in the authoritative archive.
- Flutter application version **4.1.1+5**, Dart 3.x family.
- Bundle contains `lib/`, Android target, assets, tests, docs/tooling, `pubspec.yaml`, `pubspec.lock`, `.metadata`, `LICENSE`, `openapi.json`, `cast_receiver/`, `new_ui/`, `new_designs/` and landing-page material.
- Root license is GPL-3.0. Direct implementation reuse into 4BA is blocked; only clean-room behavior/reference analysis is admitted.
- Previously audited bundle evidence identifies Better Player, cache/download/offline surfaces, Firebase analytics/auth/core/crashlytics/in-app messaging/messaging/remote-config, Mixpanel, SQLite and Unity Ads. Advertising/analytics/mandatory-cloud behavior is excluded by constitution.

## Pinned public corroboration
The public `flixquest/flixquest` repository is corroborating evidence only until decisive authoritative archive blobs are hash-matched. Its current app version also reports **4.1.1+5**.
- Root LICENSE is GPL-3.0.
- `pubspec.yaml` confirms Better Player path dependency, Firebase Analytics/Auth/Crashlytics/In-App Messaging/Messaging/Remote Config, Mixpanel and Unity Ads, plus download/cache/local persistence and `url_launcher`.
- Android build evidence uses compile/target SDK 36, Java/Kotlin 17 and Media3 1.8.0 modules for ExoPlayer, HLS, DASH, UI, database/data source and transformer. This is compatibility evidence only; 4BA's provisional Android API 24 baseline is unchanged until its own player dependency audit.
- Android manifest exposes Leanback as optional, touchscreen optional, PiP support, a Cast receiver ID, foreground download service, broad storage/install permissions, cleartext traffic and HTTP/HTTPS link handling.
- `openapi.json` describes a local scraper API with Provider, Streams, DLHD/live/EPG, Subtitles and explicit stream Proxy surfaces. Those server/provider/proxy behaviors are **not** inherited into 4BA and do not prove authorization.

## 4BA relevance
Classification: **Experience + Reference**.

Clean-room concepts worth retaining:
- adaptive Flutter navigation/home/search/details organization;
- player UX around HLS/DASH, PiP, Cast, resume and offline state where behavior can be independently specified;
- TV/Leanback and non-touch input as audit references;
- download-state UX and local cache patterns;
- explicit separation of provider/stream/config/subtitle API concepts, while replacing the upstream scraper/proxy implementation with 4BA capability contracts and authorized providers only.

## Constitution conflicts / exclusions
- **ZERO_ADS:** Unity Ads and any ad/pre-roll surface are excluded.
- **Zero-PII / optional diagnostics:** Firebase Analytics/Crashlytics/Messaging/In-App Messaging and Mixpanel are not inherited into default 4BA runtime.
- **Local-first:** Firebase Auth/Firestore/Remote Config cannot be mandatory core dependencies.
- **Native Playback First:** external-browser playback via `url_launcher` is excluded; internal WebView remains last fallback only.
- **No media relay:** the OpenAPI stream-proxy/pass-through behavior is excluded from 4BA/GitHub backend.
- **Authorized providers only:** scraper/provider presence and successful playback do not establish rights or authorization.
- Broad storage/install/cleartext permissions are not copied. 4BA must request only permissions justified by its own platform features.
- Visual assets/fonts/branding are not reusable merely because the repository is public.

## Admission decision
Migration modes: **EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR**.
Direct code/assets reuse remains blocked by GPL-3.0. No ad SDK, analytics SDK, mandatory Firebase account/cloud dependency, scraper/proxy runtime, external-browser playback or inherited credentials enter 4BA.

## Remaining evidence
Hash-match authoritative 4.1.1+5 manifest/pubspec/LICENSE/openapi and representative player/TV/download/test blobs; complete authoritative request logging/secrets/privacy and asset-license evidence. Until then the source remains partial despite strong public corroboration.
