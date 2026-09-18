# Source Evidence Card: stremio-akwam.X-main

Status: DEEP_AUDIT_PARTIAL / PROVIDER_PENDING

## Authoritative bundle evidence
- Python/FastAPI Stremio-oriented backend in the authoritative 30-project corpus.
- Architectural evidence places this source behind Provider SDK boundaries rather than in Core or Experience UI.

## 4BA relevance
Classification: **Provider + Reference + Engine**.
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

## Remaining evidence
Verify manifests/dependencies, root license/provenance, concrete capability surfaces, network targets without recording sensitive values, tests/error handling, secrets/config, ads/tracking and authorization/terms.
