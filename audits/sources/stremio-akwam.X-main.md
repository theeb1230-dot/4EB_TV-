# Source Evidence Card: stremio-akwam.X-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Python/FastAPI Stremio-oriented backend in the authoritative 30-project corpus.
- Architectural evidence places this source behind Provider SDK boundaries rather than in Core or Experience UI.
- The backend shape is sufficient to establish a transport boundary: HTTP/addon transport is an adapter, not a required 4BA runtime dependency.

## 4BA relevance
Classification: **Provider + Reference + Engine**.
Useful clean-room concepts are limited to capability declaration, normalized catalog/metadata/stream boundaries, deterministic failure handling, cancellation/timeout semantics and provider isolation.

## Provider admission boundary
Stremio/addon compatibility, public source code, a working endpoint or successful stream discovery does not prove authorization. Production admission requires per-source evidence for authority, content rights, license/provenance, network behavior, terms, credential handling and runtime cost.

## Constitution rules
- Search, Metadata, Stream, Download, Subtitle, Live and EPG are independently declared capabilities.
- Stream never implies Download.
- Metadata identity is canonical/provider-independent.
- HTTP/FastAPI/Stremio transport is replaceable and never required for local startup, library, settings or cached metadata.
- Requests must be bounded by cancellation, timeout and normalized errors; one provider failure cannot stall the resolver graph.
- No DRM/paywall/authentication/anti-bot bypass.
- No harvested cookies/tokens/credentials/private playlists.
- No mandatory backend or video relay/proxy.
- Provider failures are isolated and cannot prevent local library/settings startup.
- Normal UX hides provider identity; Advanced Sources may expose authorized candidates.

## Evidence-bounded closure
The authoritative corpus establishes the technology family and provider/backend role, but does not establish compatible direct-reuse rights or authorization for the underlying content/network targets. Executing unresolved endpoints would not cure that evidence gap and could violate the product constitution.

4BA therefore closes this root fail-closed. No source endpoint, stream target, credential, token, cookie, private configuration, scraper/extractor behavior, proxy/relay path, ad/tracking behavior or mandatory backend runtime is migrated. The retained clean-room value is the transport contract: adapters are cancellable, timeout-bounded, capability-scoped and failure-isolated, with normalized results flowing into the Provider SDK rather than directly into UI.

Runtime cost for the excluded implementation is zero. Any future provider must independently prove authorization, licensing, privacy, ZERO_COST and Native Playback compatibility before admission.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING + DIRECT_REUSE_BLOCKED**. No production provider is enabled by this card.

**Phase-1 result: AUDIT COMPLETE — clean-room transport/provider contract reference only. Runtime provider remains PROVIDER_PENDING.**
