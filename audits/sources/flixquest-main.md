# Source Evidence Card: flixquest-main

Status: DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED

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

## Evidence-bounded closure
The authoritative archive establishes the 4.1.1+5 Flutter application, GPL-3.0 root license, Better Player/cache/download/offline families, Firebase/Mixpanel/Unity Ads presence, OpenAPI/provider/server surfaces, Android target and tests. Version-matched public commit `344c8f7a4ee8da73577874f8c79f9556245fb137` is corroborating implementation evidence, not an authorization shortcut.

Additional correlated evidence confirms:
- offline player and download widget-test surfaces;
- TV/movie loaders keep download state explicit rather than silently conflating watch and download;
- Android requests broad storage/install permissions and optional Leanback capability, which 4BA will not inherit wholesale;
- the scraper client documents proxying streams to hide upstream headers/anti-hotlink details. That behavior directly conflicts with 4BA's no-media-relay/provider-authorization boundary and is rejected;
- OpenAPI token/proxy secrets and third-party-host download-token behavior are server concerns and are not copied or reproduced.

A full asset-by-asset license grant is not needed to close the audit because **all direct code/assets reuse is already blocked by GPL-3.0 for this migration path**. Unknown asset provenance therefore remains an exclusion, not an open admission question. Likewise, absence of complete authoritative request-log proof cannot authorize telemetry; 4BA rejects inherited analytics/logging/cloud identity by default.

**Phase-1 result: AUDIT COMPLETE — EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR only. Direct code/assets reuse: BLOCKED. Runtime provider/proxy admission: REJECTED.**
