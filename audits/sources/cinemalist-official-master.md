# Source Evidence Card: cinemalist-official-master

Status: DEEP_AUDIT_PARTIAL / EXPERIENCE_REFERENCE

## Authoritative bundle evidence
- Flutter client with roughly 250 files in the authoritative archive.
- Inventory/source evidence identifies TMDB-oriented discovery and BLoC/state-management architecture signals.
- Primary value is presentation/discovery structure, not a production provider or playback engine.

## 4BA relevance
Classification: **Experience + Reference**.
Candidate clean-room concepts: discovery/home composition, content cards/details, Flutter state separation and responsive interaction patterns. Official/default Experience remains 4BA Cinematic Gold.

## Admission boundaries
- TMDB/API usage requires independent API-term, key-storage and ZERO_COST review.
- UI may consume canonical 4BA metadata/search contracts only; it cannot bind directly to a TMDB/provider response model.
- No assets/branding/code are reusable until root license and asset provenance are verified.
- No player capability is inferred without file-level player evidence.
- Ads/tracking/telemetry and secret/config handling remain explicit open gates.

## Migration decision
Migration mode: **EXPERIENCE_REFERENCE**. Recreate useful interaction concepts through the 4BA Design System and canonical contracts.

## Remaining evidence
Verify pubspec, root license, BLoC/router entry points, TMDB/network client and key loading, storage, tests, platform manifests, player absence/presence, ads/tracking and asset provenance.
