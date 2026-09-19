# Source Evidence Card: ARB-S33-3-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Node/Stremio ArabSeed-oriented addon in the authoritative 30-project corpus.
- Architectural evidence places this source behind Provider SDK boundaries rather than in Core or Experience UI.

## 4BA relevance
Classification: **Provider + Reference**.
Useful clean-room concepts are limited to capability declaration, normalized catalog/metadata/stream boundaries, deterministic failure handling and provider isolation.

## Provider admission boundary
Stremio/addon compatibility, public source code, a working endpoint or successful stream discovery does not prove authorization. Production admission requires per-source evidence for authority, content rights, license/provenance, network behavior, terms, credential handling and runtime cost.

## Constitution rules
- Search, Metadata, Stream, Download, Subtitle, Live and EPG are independently declared capabilities.
- Stream never implies Download.
- Metadata identity is canonical/provider-independent.
- No DRM/paywall/authentication/anti-bot bypass.
- No harvested cookies/tokens/credentials/private playlists.
- No mandatory backend or video relay/proxy.
- Provider failures are isolated and cannot prevent local library/settings startup.
- Normal UX hides provider identity; Advanced Sources may expose authorized candidates.

## Evidence-bounded closure
The authoritative bundle is sufficient to classify this root as a Node/Stremio provider reference and establish the safe migration boundary without executing or reproducing unresolved provider targets. Compatible root reuse rights and per-target stream/content authorization are not established by the bundle, so direct/runtime reuse fails closed.

No endpoint, stream URL, credential, token, cookie, private playlist, scraper/extractor implementation, relay/proxy behavior, ad/tracking behavior, or mandatory backend dependency is migrated. Runtime cost for the excluded implementation is therefore zero. Any future ArabSeed-oriented or equivalent provider must enter independently through Provider SDK contracts and prove licensing, authorization, privacy, ZERO_COST and native-playback compatibility.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING + DIRECT_REUSE_BLOCKED**. No production provider is enabled by this card.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Runtime provider remains PROVIDER_PENDING; direct reuse BLOCKED.**
