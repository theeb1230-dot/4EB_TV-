# 4BA License & Security Audit

Status: Phase 1. The authoritative bundled ZIP is directly readable. Presence of a LICENSE file is **not** equivalent to reuse approval.

| Source | Authoritative bundle license evidence | Security/privacy evidence | 4BA decision |
|---|---|---|---|
| Aniyomi 0.18.1.2 | Root LICENSE is Apache-2.0; LICENSE and settings.gradle.kts blob hashes match inspected upstream, while bundled app version is older | Android source includes WebView/player/tracker/config surfaces requiring file-level review; no credential values copied | REFERENCE / conditional direct reuse only after dependency + NOTICE + file audit |
| AIOStreams 2.32.1 | **Conflict:** package.json says MIT; root LICENSE contains GPL-3.0 | Description explicitly includes proxy/IP-restriction-bypass behavior; analytics/session/config surfaces present | CLEAN-ROOM CONCEPTS ONLY; bypass behavior excluded |
| FlixQuest 4.1.1+5 | Root LICENSE contains GPL-3.0 | pubspec includes Firebase Analytics/Crashlytics/In-App Messaging, Mixpanel and unity_ads_plugin; local BetterPlayer path dependency | EXPERIENCE/REFERENCE concepts only; all ads/tracking integrations excluded; direct reuse blocked pending licensing decision |
| AIOMetadata 2.7.1 | **Conflict:** package.json says Apache-2.0; root LICENSE contains GPL-3.0 | env/config/cache/database and request-tracking surfaces require deeper review | CLEAN-ROOM METADATA concepts only pending license resolution |

## Mandatory handling
Never reproduce credential/token/cookie/private-key values in commits, issues, PRs or audit reports. Unknown or conflicting-license code is not copied. Advertising SDKs, ad tracking, popups and pre-roll are rejected. Paid dependencies cannot become mandatory. DRM/paywall/access-control bypass is excluded. Source assets require their own licensing evidence where applicable.

## Verified hard exclusions from Wave 1
- FlixQuest advertising dependency: `unity_ads_plugin`.
- FlixQuest analytics/telemetry integrations: Firebase Analytics/Crashlytics and Mixpanel are not carried into 4BA.
- AIOStreams proxy/IP-restriction-bypass behavior is not a 4BA capability.
- No secret values from any `.env`, Google services file, workflow or source file may be copied.

## Current blockers
1. Finish file-level player/network/data-model/dependency review for the remaining PARTIAL roots.
2. Resolve AIOStreams bundled MIT declaration versus GPL-3.0 root license before any direct reuse.
3. Resolve AIOMetadata bundled Apache-2.0 declaration versus GPL-3.0 root license before any direct reuse.
4. Treat FlixQuest GPL source as reference/clean-room unless a compatible licensing decision is explicitly made; ZERO_ADS/Zero-PII exclusions apply regardless.
5. Continue provenance matching by bundle version/blob hashes instead of assuming current upstream equals the archived snapshot.

## Evidence expansion beyond Wave 1
- **Cinemax:** Apache-2.0 root evidence is verified; direct reuse still waits on NOTICE/assets/API terms and dependency obligations. API keys stay outside source control.
- **CineSpot:** no root license was found in the authoritative bundle, therefore direct implementation reuse is blocked. Firebase configuration values are never copied; mandatory Firebase/cloud coupling is not a Core dependency.
- **Anthology:** package-level MIT declaration is insufficient while root-license evidence is pending. Each provider remains independently authorization-gated.
- **Al-Qahtani:** media relay/proxy, client-IP/address telemetry, inherited ads/tracking and primary legacy WebView bridges are excluded. Only contract/Experience concepts may be referenced.
- **cinemalist / cinextma:** Experience-reference only until root license, dependency, asset provenance, network/config and player evidence closes. TMDB/Supabase presence does not authorize API use or make cloud services mandatory.
- **Filmex:** Phase-1 audit is complete as EXPERIENCE_REFERENCE only. The authoritative bundle contains no LICENSE/NOTICE/COPYING file, so direct code/assets reuse is blocked. Firebase initialization is mandatory in source startup and Authentication/Firestore/Google Sign-In are used across account/list/admin flows, so mandatory cloud/account coupling is excluded from 4BA Core. `google_mobile_ads` plus an Android AdMob application ID are present and fully excluded under ZERO_ADS. Actual playback is WebView/Google-Drive-preview oriented with unrestricted JavaScript and Android third-party cookies; `video_player` is declared but no `VideoPlayer` usage was found in the bounded Dart scan. WebView-first playback is excluded under Native Playback First.
- **turkish-series:** large mutable datasets require license/data provenance and freshness/rollback evidence; they are not compiled wholesale into Core or application binaries.
- **xoxixoxi:** Puppeteer/ffmpeg/extraction runtime is blocked pending license, authorization and process-security evidence. Bypass and media relay behavior are excluded.
- **Live/sports family:** public playlist or EPG reachability never proves stream redistribution authority. Private playlists, captured cookies/tokens and credentials are excluded.
- **Addon/provider family:** Stremio/addon compatibility, public code and successful discovery do not prove source/content authorization.
- **orien.live:** quarantined. Credential discovery/harvesting/replay/sharing is not executed or migrated.
- **CinemaPress:** Phase-1 audit is complete as CONTRACT_REFERENCE only. Authoritative `package.json`, `LICENSE.txt`, `README.md` and `app.js` exactly match public `CinemaPress/CinemaPress` master commit `2a9d3fa4bcd9cb92ce031b3e7324f1d7e76050b5`; root MIT is verified. Runtime adoption is still rejected: authoritative code includes embedded/default third-party API credentials, IP/WHOIS/geolocation/cookie profiling, advertising/prebid surfaces, and server/embed/iframe/CinemaPlayer behavior. Secret values were not copied. No package lock or conventional tests were found.
- **ProxyFill:** Phase-1 audit is complete as an evidence-backed exclusion. The authoritative archive exactly matches six decisive blobs from pinned public commit `1a49d164d10aa24ae5ef57b6a275758500310bae`. The bundle contains no LICENSE/NOTICE-named file, direct reuse fails closed, secret-handling defects are proven, and runtime remains EXCLUDED.

### Fail-closed reuse rule
Unknown or unresolved license/provenance is never treated as permissive. A source stays reference-only, provider-pending, quarantined or excluded until the evidence required by its migration mode is complete. Successful tests, public availability, repository presence or technical compatibility cannot override this rule.
