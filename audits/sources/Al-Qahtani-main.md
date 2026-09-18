# Source Evidence Card: Al-Qahtani-main

Status: DEEP_AUDIT_PARTIAL / REFERENCE_ONLY

## Authoritative bundle evidence
- 163 files in the authoritative archive.
- Mixed Flutter + Node + Web + Python clean-room continuation.
- Flutter snapshot version 1.0.33+33; verified dependency signals include http, path_provider, share_plus, shared_preferences, video_player and webview_flutter.
- Node runtime is private ESM, Node >=22, with explicit checks/tests.
- Migration documentation states a clean-room continuation preserving useful behavior while removing ads/legacy coupling and preparing provider migration.
- Legacy Player.html / bsr-Player.html Android bridge paths remain in the snapshot and are transitional evidence, not 4BA architecture.
- server/fallback-runtime.mjs evidence includes opaque references, TTL, provider ranking/probing, strict media types, Range validation, timeouts, redirect rejection and content/container consistency.
- server/hardening.mjs evidence includes expiry sweep, in-memory rate limiting, compression and client-address extraction including forwarded-address handling.

## 4BA relevance
Classification: **Provider + Engine + Experience/Reference**.
Useful clean-room concepts: provider isolation, bounded probing, deterministic fallback/health, strict response/media validation, Arabic migration lessons and testable provider boundaries.

## Hard constitution divergences
- Direct-media relay/proxy behavior is **EXCLUDED**. 4BA/GitHub backend must never become the video data path.
- Client IP/address handling is not inherited. Zero-PII diagnostics must not persist or transmit identifying network data.
- Legacy Android/WebView bridges cannot become primary playback. 4BA remains Native Playback First and internal WebView is final fallback only.
- Any inherited ads/popups/tracking remain excluded.
- Provider URLs/behavior require independent authorization evidence.

## Security boundary
Useful server hardening ideas such as bounded TTL, timeouts, rate limits and strict content validation may be clean-room reimplemented only where a legitimate optional metadata/config gateway exists. They do not justify a mandatory backend or media proxy.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + EXPERIENCE_REFERENCE**. Health/fallback and validation concepts may inform 4BA-owned contracts. Media relay/proxy, PII-address handling and legacy primary WebView bridges are EXCLUDED.

## Remaining evidence
Verify root/license provenance, exact Node/Flutter dependency manifests, secrets/config loading, ads/tracking scans, workers/API schemas, provider authorization, test assertions and which legacy bridge paths are still reachable.
