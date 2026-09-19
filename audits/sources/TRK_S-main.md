# Source Evidence Card: TRK_S-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Turkish Stremio-oriented addon in the authoritative 30-project corpus.
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
The authoritative corpus establishes enough architecture to classify this root and define its safe migration boundary. It does not establish compatible direct-reuse rights or per-source stream authorization. Executing unresolved targets merely to gather more detail would not turn reachability into authorization, so Phase-1 closes this root fail-closed.

No provider implementation, endpoint, stream URL, credential, cookie, token, private playlist, proxy/relay, bypass behavior, ad/tracking behavior or mandatory backend dependency is migrated. Turkish catalog/metadata/stream separation and capability declaration remain clean-room contract references only. Any future Turkish provider must independently prove license/provenance, authority, ZERO_COST, ZERO_ADS, Zero-PII and native-playback compatibility before runtime admission.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Runtime provider remains PROVIDER_PENDING; direct reuse BLOCKED.**
