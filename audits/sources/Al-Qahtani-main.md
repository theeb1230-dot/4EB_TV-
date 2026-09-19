# Source Evidence Card: Al-Qahtani-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / EXPERIENCE_REFERENCE / RUNTIME_REJECTED

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

## Evidence-bounded closure
The authoritative archive is sufficient to bound the useful architecture and the constitution-incompatible runtime. It does not establish reusable root-license/provenance or provider/content authorization. That absence is decisive for implementation/runtime admission and therefore fails closed rather than leaving an ambiguous production path.

No source code, provider endpoint, credential/config value, media relay/proxy path, IP/address collection, ad/tracking behavior, legacy external-browser bridge or WebView-primary playback is admitted into 4BA. The verified Flutter/Node dependency signals and fallback/hardening behavior are used only to define clean-room contracts and tests.

Reusable output is limited to 4BA-owned specifications for provider isolation, bounded health probing, TTL/timeouts, strict media/content validation, deterministic fallback, rate-limit concepts for an optional legitimate metadata/config gateway, and Arabic migration/UX lessons. Any future provider requires independent authorization and any optional gateway must remain Zero-Cost-compatible and outside the media data path.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE + EXPERIENCE_REFERENCE only. Runtime/provider admission: REJECTED under current evidence. Direct implementation reuse: NOT GRANTED.**
