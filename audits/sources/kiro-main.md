# Source Evidence Card: kiro-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- small provider/source project in the authoritative 30-project corpus.
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

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING**. No production provider is enabled by this audit state.

## Evidence-bounded closure
The authoritative bundle establishes a small provider/source family and enough structure to bound its role behind Provider SDK contracts, but it does not establish compatible root reuse rights, per-target content authorization, or production-safe network/config provenance. Phase 1 therefore closes fail-closed rather than treating technical reachability as authorization.

- Direct code/runtime reuse is blocked under current evidence.
- No endpoint, stream target, credential, token, cookie, private configuration, scraper/extractor behavior, relay/proxy behavior, bypass behavior, or ad/tracking behavior is admitted.
- Only clean-room capability declaration, catalog/metadata/stream separation, deterministic normalized failures and provider isolation may inform 4BA contracts.
- Any future runtime provider requires independent license/provenance, content authorization, safe network/config review, bounded cost and constitutional playback compliance.

Final decision: **AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED**. Audit completion does not authorize a provider.
