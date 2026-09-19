# Source Evidence Card: NuvioStreamsAddon-master

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Node streaming addon/aggregator in the authoritative 30-project corpus.
- Architectural evidence places this source behind Provider SDK boundaries rather than in Core or Experience UI.
- The bundle establishes the addon/aggregation family and capability boundary, but does not establish compatible root reuse rights or authorization for individual runtime stream sources.

## 4BA relevance
Classification: **Provider + Reference + Engine**.
Useful clean-room concepts are limited to capability declaration, normalized catalog/metadata/stream boundaries, deterministic failure handling, provider isolation and independently gated capabilities.

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
The unresolved per-source runtime surfaces cannot be admitted safely from the available evidence. 4BA therefore closes this source fail-closed rather than executing or reproducing unresolved endpoints merely to gather more detail. No provider module, stream target, credential/token/cookie/private configuration, proxy/relay/bypass behavior, ad/tracking behavior or mandatory backend dependency is migrated.

The reusable result is a 4BA-owned clean-room capability contract and failure-isolation model. Any future provider implementation must independently prove authorization, compatible licensing, ZERO_COST, ZERO_ADS, Zero-PII and native-playback compatibility before runtime admission.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING**. Direct/runtime reuse is blocked. No production provider is enabled by this audit.

**Phase-1 result: AUDIT COMPLETE — clean-room contract reference; direct reuse blocked and every runtime provider remains independently gated.**
