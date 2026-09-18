# Source Evidence Card: cinemalist-official-master

Status: DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE_ONLY / CLEAN_ROOM

## Authoritative snapshot / provenance
- Authoritative bundle root contains 348 non-AppleDouble entries and is a Flutter client focused on TMDB-backed discovery, movies, TV, people, saved items and search.
- The archived snapshot is decisively matched to public `bisunajaime/cinemalist-official` master commit `bc46abf74c09e35de475f356824c0b1756a9da88` by exact Git blob SHA-1 for the files material to the audit decision:
  - `pubspec.yaml` -> `8e23c0a98937e1d57dfa05243fe70f50f44a423f`
  - `LICENSE.txt` -> `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7`
  - `lib/main.dart` -> `227d57b8e1bce39694cb1ecade7233aa7b8cabd9`
  - `lib/repository/tmdb_client/tmdb_api_client.dart` -> `6041c60e1a46fe3253aad524ca18ee7e3b27a834`
- Package version is `2.0.0+200`; Dart constraint is `>=3.2.0 <4.0.0`.

## License / reuse
- Authoritative root `LICENSE.txt` is GNU GPL v3 and exactly matches the pinned public repository blob.
- For 4BA this source is therefore used as **EXPERIENCE_REFERENCE / CLEAN_ROOM_BEHAVIOR** only. No Cinemalist implementation code is copied into differently licensed 4BA components.
- Images, icons, TMDB imagery/branding and other assets are not assumed cleared merely because the repository has a GPL root license; external asset/API provenance remains independently governed.

## Technology / architecture / dependencies
- Flutter/Material application with BLoC/Cubit state management and repository/client separation around TMDB metadata.
- Authoritative dependencies include `http`, `bloc`, `flutter_bloc`, `cached_network_image`, `flutter_cache_manager`, `connectivity_plus`, `url_launcher`, `youtube_player_flutter`, `logger`, `share_plus`, `path_provider`, `google_fonts`, `flutter_svg` and `flutter_animate`.
- `pubspec.lock` is present in the authoritative root.
- UI structure includes splash, home, movies, TV shows, saved records, search and more/settings-style navigation.
- Source offers both light and dark themes; 4BA V1 remains dark-only, so light-theme behavior is not inherited as a product requirement.

## Metadata / network behavior
- `TMDBApiClient` talks directly to `api.themoviedb.org` API v3 and implements genre, discover, upcoming, trending, now-playing, movie/TV details, casts, seasons, similar content, people and search requests.
- This is **metadata** behavior only. It does not authorize a Stream Provider or media source and it does not collapse Metadata into Streams.
- Production TMDB use in 4BA remains independently subject to current API terms, attribution, authorization/key management, rate/cost constraints and ZERO_COST review.
- UI must consume canonical 4BA Metadata/Search contracts rather than TMDB response models directly.

## Secrets / configuration
- Authoritative `main.dart` reads `TMDB_API_KEY` from compile-time environment but also contains a **non-empty hard-coded default TMDB API key**.
- The key value is deliberately not reproduced in 4BA documentation, commits or logs.
- 4BA will not carry embedded/default provider credentials. Any approved metadata credential must be injected through an appropriate secure/configuration boundary and must not become a public-repository secret.

## Privacy / telemetry / ads
- A bounded authoritative code scan found no selected Google Mobile Ads/Firebase Analytics/Crashlytics/Mixpanel/Sentry/Amplitude-style SDK signatures.
- Authoritative `PrivacyPolicy.md` nevertheless describes third-party service/log-data collection that may include IP address, device/OS/configuration, time and related statistics. That document is policy evidence, not proof that every described collection path exists in the inspected Dart code.
- 4BA does **not** inherit IP/device telemetry or third-party tracking. Zero-PII and local/optional anonymous diagnostics remain mandatory.
- The bounded scan result is not a blanket security warranty; it is sufficient for the clean-room Experience-reference decision.

## Player / external launch behavior
- `youtube_player_flutter` is used for YouTube/trailer-oriented presentation. This is not evidence of a native movie/episode stream player and no Player capability is promoted from Cinemalist.
- `url_launcher` is used to launch URIs. External-browser playback is forbidden in 4BA; launcher behavior is not inherited for media playback.
- No authoritative evidence establishes HLS/DASH/MP4 movie/episode playback, resume/fallback, subtitle/audio switching or provider aggregation.
- 4BA Native Playback First remains fully independent of this source.

## Local persistence
- Authoritative code uses `path_provider` and a file-backed local storage repository for JSON state such as saved/watch-later records.
- Local-first persistence is a useful **behavioral reference**, but Core owns canonical 4BA storage and no GPL implementation is copied.

## Tests / platform evidence
- No test files were found in the authoritative root under the expected Flutter test structure during the bounded archive scan.
- The inspected Android manifest declares Internet access and normal launcher activity behavior; no extra permission is promoted into 4BA from this source.
- No evidence was found here for Android TV D-pad/focus, Arabic RTL, Turkish localization, offline media, resolver/provider fallback or accessibility acceptance tests.

## 4BA relevance
Classification: **Experience + Reference**.
Clean-room value:
- discovery/home composition,
- movie/TV/person browsing and search flows,
- BLoC/repository presentation separation as an architectural idea,
- saved/watch-later interaction concepts,
- local JSON persistence behavior as reference,
- responsive card/detail motion ideas recreated through the 4BA Design System.

Cinemalist is not admitted as a selectable Experience. 4BA Cinematic Gold remains the official/default Experience.

## Migration decision
Migration mode: **EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR** only.
- Direct implementation reuse is blocked by the confirmed GPLv3 snapshot under the current 4BA migration choice.
- Source assets/branding are not copied.
- The embedded default TMDB key is excluded and never recorded.
- TMDB production authorization/terms remain a separate Metadata Engine gate.
- YouTube trailer and external-launch behavior are not promoted to the 4BA Player.
- No Provider capability is admitted from this source.

## Phase-1 closure
Cinemalist satisfies Phase-1 audit requirements as an evidence-backed clean-room Experience reference:
1. provenance/version: authoritative snapshot matched by four decisive Git blobs,
2. architecture: Flutter/BLoC/repository/TMDB client verified,
3. license/reuse: authoritative GPLv3 verified; direct implementation reuse blocked by migration decision,
4. dependencies: authoritative pubspec/lock and major runtime dependencies inventoried,
5. network/API/cost: TMDB v3 metadata behavior documented; production authorization/terms separated,
6. secrets/privacy/telemetry/ads: embedded default key identified without value; privacy-policy telemetry terms rejected; bounded code scan found no selected ad/analytics SDK signatures,
7. player/provider: YouTube trailer/external launcher documented; no movie/episode stream Player or Provider capability promoted,
8. migration destination: EXPERIENCE_REFERENCE + CLEAN_ROOM_BEHAVIOR only,
9. risks/clean-room boundary: assets, API credentials, telemetry policy, external launcher and direct GPL implementation copy explicitly excluded.
