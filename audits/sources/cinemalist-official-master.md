# Source Evidence Card: cinemalist-official-master

Status: DEEP_AUDIT_PARTIAL / EXPERIENCE_REFERENCE

## Authoritative bundle evidence
- Flutter client with roughly 250 files in the authoritative archive.
- Inventory/source evidence identifies TMDB-oriented discovery and BLoC/state-management architecture signals.
- Primary value is presentation/discovery structure, not a production provider or playback engine.

## Public corroborating repository
A public repository with the matching project name exists at `bisunajaime/cinemalist-official` on branch `master`. It is corroborating evidence only until decisive authoritative-bundle blobs are matched.

Public-root evidence inspected in this audit wave:
- `pubspec.yaml` blob `8e23c0a98937e1d57dfa05243fe70f50f44a423f`: package `cinemalist`, description `TheMovieDB API Build with Flutter`, version `2.0.0+200`, Dart `>=3.2.0 <4.0.0`.
- Declared runtime dependencies include `http`, `bloc`, `flutter_bloc`, `cached_network_image`, `flutter_cache_manager`, `connectivity_plus`, `url_launcher`, `youtube_player_flutter`, `logger`, `share_plus`, `path_provider`, `google_fonts`, `flutter_svg` and `flutter_animate`.
- Root `LICENSE.txt` blob `f288702d2fa16d3cdf0035b15a9fcbc552cd88e7` contains GNU GPL v3 text. This does **not** yet prove the authoritative archived root has the same license/version.
- Public tree contains Android, iOS, assets, `lib`, `pubspec.lock`, `PrivacyPolicy.md`, CI and Flutter test structure. It also contains committed `.gradle` material, so repository hygiene is not a pattern to import.
- `youtube_player_flutter` and `url_launcher` are declared capabilities/dependencies; declaration alone is not evidence that 4BA should adopt external-browser playback or a WebView-first player.

## 4BA relevance
Classification: **Experience + Reference**.
Candidate clean-room concepts: discovery/home composition, content cards/details, Flutter state separation and responsive interaction patterns. Official/default Experience remains 4BA Cinematic Gold.

## Admission boundaries
- TMDB/API usage requires independent API-term, attribution, key-storage and ZERO_COST review. No key or credential may be copied from source material.
- UI may consume canonical 4BA metadata/search contracts only; it cannot bind directly to a TMDB/provider response model.
- Direct code/assets reuse remains blocked until authoritative-bundle provenance and license matching is complete. If GPLv3 applies to the authoritative snapshot, any reuse decision must be made explicitly rather than accidentally contaminating differently licensed 4BA components; clean-room behavioral reimplementation remains the default.
- Native Playback First remains mandatory. `youtube_player_flutter`/`url_launcher` declarations do not authorize external-browser playback, and no player capability is promoted from this source.
- Ads/tracking/telemetry, secret/config handling, local persistence and platform-manifest permissions remain explicit open gates until authoritative files are inspected.

## Migration decision
Migration mode: **EXPERIENCE_REFERENCE**. Recreate useful interaction concepts through the 4BA Design System and canonical contracts. No Provider or Player capability is admitted from this source in the current evidence state.

## Remaining evidence
Match decisive authoritative-bundle blobs against the public repository (at minimum pubspec/license/entry point/network client); then verify BLoC/router entry points, TMDB network client and key loading, storage, tests, platform manifests, player behavior, ads/tracking and asset provenance. Only after those cells close may this root move from `DEEP_AUDIT_PARTIAL`.
