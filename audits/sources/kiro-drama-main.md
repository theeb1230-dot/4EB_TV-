# Source Evidence Card: kiro-drama-main

Status: AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Small JS/JSON drama-source family in the authoritative 30-project corpus.
- Architecture places the source behind Provider SDK boundaries rather than Core or Experience UI.
- Direct runtime reuse is not admitted because compatible root reuse rights and per-source authorization are not established.

## 4BA relevance
Classification: **Provider + Reference**.
Clean-room value is limited to capability declaration, normalized catalog/metadata/stream boundaries, deterministic failure handling and provider isolation.

## Dependency and runtime boundary
- Dependency family is bounded as a small JS/JSON provider/addon source.
- No dependency or transport from this source becomes a mandatory 4BA backend.
- Network endpoints and stream targets are intentionally not migrated; every runtime target requires independent authorization and rights evidence.

## Security, privacy and advertising boundary
- No credentials, cookies, tokens, private playlists or configuration values are copied into 4BA.
- No scraper/extractor, anti-bot, DRM/paywall/authentication bypass, media relay or proxy behavior is admitted.
- No advertising or tracking behavior is admitted from the unresolved runtime.
- Provider failure cannot prevent local library/settings startup; diagnostics remain local/Zero-PII by default.

## Capability boundary
- Search, Metadata, Stream, Download, Subtitle, Live and EPG are independently declared capabilities.
- Stream never implies Download.
- Metadata identity is canonical/provider-independent.
- Normal UX hides provider identity; Advanced Sources may expose only authorized candidates.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING + DIRECT_REUSE_BLOCKED**.
No production provider is enabled by this audit state. Runtime admission requires separate evidence for authority, content rights, license/provenance, network behavior, terms, credential handling and zero-cost compatibility.

## Closure rationale
The Phase-1 audit is complete because unresolved runtime reuse is rejected fail-closed rather than inferred from a working endpoint, public source, addon compatibility or stream discovery. Provider approval remains a separate post-audit gate.
