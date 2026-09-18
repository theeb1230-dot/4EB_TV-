# Source Evidence Card: Filmex-main

Status: DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE_ONLY

## Authoritative bundle evidence
- Authoritative bundle root contains 122 file entries including AppleDouble metadata; the actual source is a compact Flutter application.
- `pubspec.yaml` identifies app package `moviehub`, version `1.0.0+1`, Dart SDK `^3.9.0` and a dependency set centered on Firebase, WebView and Google Mobile Ads.
- No LICENSE/NOTICE/COPYING-named file exists in the authoritative Filmex root. Direct implementation/assets reuse therefore fails closed.
- README is generic Flutter starter text and does not provide separate licensing/provenance terms.

## Technology / architecture
- Flutter/Material application with Android platform project present.
- Entry point initializes Firebase before rendering and routes directly to `LoginScreen`; account/cloud operation is therefore coupled to startup behavior in the source design.
- Main screens include home, movie detail, TV-show detail, login, registration, admin panel and episode player.
- Data model is Firestore-oriented and services include Firebase-backed list/account behavior.

## Dependencies
Direct dependencies in the authoritative manifest include:
- `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `google_sign_in`,
- `webview_flutter` plus Android/WKWebView implementations,
- `video_player`, `image_picker`, `flutter_animate`,
- `google_mobile_ads`, plus standard Flutter/Cupertino dependencies.

`pubspec.lock` is present and pins the resolved package graph. Android also declares the Google Services plugin/Firebase BoM and Google authentication dependencies.

## ZERO_COST / local-first boundary
- Firebase initialization is mandatory in `main.dart`, and Authentication/Firestore are used throughout login/register/home/admin/list flows.
- 4BA does not inherit mandatory Firebase, cloud account, Firestore or Storage coupling. Local mode remains the default and core functionality must operate without a paid/hosted backend dependency.
- Login/account screens may inform UX comparison only; 4BA V1 does not require an account.

## ZERO_ADS evidence
- `google_mobile_ads` is a direct dependency.
- Android manifest declares a Google Mobile Ads application ID.
- No Dart `BannerAd`, `InterstitialAd`, `RewardedAd`, `AdWidget` or `MobileAds` calls were found in the bounded Dart scan, so the archive shows ad-SDK integration/configuration even if active ad rendering is not evidenced in current Dart sources.
- All Google Mobile Ads dependency/configuration is **EXCLUDED** from 4BA under permanent ZERO_ADS.

## Privacy / identity
- Firebase email/password authentication and Google Sign-In are implemented.
- Registration/login flows handle email/password and OAuth tokens and persist user documents in Firestore.
- No credential/token values are reproduced in 4BA audit documents.
- This identity/cloud model is not migrated into 4BA Core; optional future sync must remain separate from local-first state and Zero-PII rules.

## Player / WebView findings
- Although `video_player` is declared, the authoritative Dart scan found no `VideoPlayer` usage.
- Actual episode playback is implemented with `webview_flutter`, unrestricted JavaScript and remote URL loading.
- Google Drive `/view`/`/edit` URLs are transformed into `/preview`; movie detail playback also uses WebView and explicitly enables Android third-party cookies.
- These behaviors violate 4BA Native Playback First as a primary playback path. WebView playback, Drive-preview coupling, unrestricted JavaScript and third-party-cookie acceptance are **not migrated**. Internal WebView remains a last-resort 4BA fallback only after native HLS/DASH/MP4 paths fail and only for authorized sources.

## Network / API / data behavior
- Network behavior is primarily Firebase/Google Sign-In/Firestore plus remote image/Google Drive preview URLs.
- No independent Provider SDK abstraction is present; cloud models and UI are directly coupled.
- 4BA UI must instead consume canonical Core/Metadata/Provider contracts, never Firestore/provider-specific response models.

## Tests / quality evidence
- One `test/widget_test.dart` exists, but it is the default Flutter counter smoke-test template and does not represent the current Firebase/login application behavior. It is not accepted as meaningful Filmex feature coverage.
- No evidence of TV-focus, RTL/language, offline, resolver/provider, player fallback or accessibility tests exists in this root.

## Assets / provenance
- Screenshots, launcher artwork and app-icon assets exist, but no asset-specific license/provenance evidence is present. Assets are not copied into 4BA.

## 4BA relevance
Classification: **Experience + Reference**.
Potential clean-room value:
- compact card/navigation/detail layout comparison,
- list/favorite interaction ideas,
- simple full-screen playback/loading UX concepts after rewriting behind 4BA Player contracts,
- authentication/admin screens only as negative/optional UX reference.

Filmex is not admitted as a selectable Experience. Any useful visual behavior must be recreated through 4BA Design System and canonical state contracts.

## Migration decision
Migration mode: **EXPERIENCE_REFERENCE** only.
- Direct code/assets reuse is blocked by missing root license/provenance.
- Firebase/cloud/account coupling is excluded from Core/default operation.
- Google Mobile Ads is excluded.
- WebView-first/Drive-preview player is excluded as a primary player.
- No provider/network implementation is promoted from Filmex.

## Phase-1 closure
Filmex satisfies Phase-1 audit requirements as an evidence-backed reference-only source:
1. provenance/version: authoritative root + `1.0.0+1` manifest evidence,
2. architecture: Flutter/Firebase/WebView structure verified,
3. license/reuse: no bundle license -> direct reuse blocked fail-closed,
4. dependencies: pubspec + lockfile and Android integration inventoried,
5. network/API/cost: Firebase/Google/Drive coupling documented; mandatory cloud rejected,
6. secrets/privacy/ads: auth/token handling and ad-SDK configuration documented without secret values; ads excluded,
7. player/provider: WebView/Drive player verified; native `VideoPlayer` usage not found; WebView-first behavior rejected,
8. migration destination: EXPERIENCE_REFERENCE only,
9. risks/clean-room boundary: assets, ads, mandatory cloud/account and player coupling explicitly excluded.
