# Source Evidence Card: anthology-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_RUNTIME_REJECTED

## Authoritative bundle evidence
- 2,900 files in the authoritative archive.
- Node/Nuvio/Stremio-oriented Turkish provider corpus; package version 1.7.28.
- package metadata declares MIT. Root LICENSE still requires independent file-level verification before any LICENSED_REUSE decision.
- Provider-oriented tree contains many addon/provider modules plus explicit verification scripts.
- Verified test entry points include `test_stremio_addon.js`, `test_all_catalogs.js`, `test_all_providers.js` and `test_playability.js`.
- Dependency evidence includes `cheerio-without-node-native`, consistent with HTML parsing/provider adapters.

## 4BA relevance
Classification: **Provider + Engine + Reference**.
Useful clean-room concepts: provider registry/capability discovery, manifest-driven boundaries, systematic catalog/provider/playability qualification, and failure isolation.

## Authorization boundary
Stremio/addon compatibility, a working public URL, or successful playability tests are **technical evidence only**. They do not establish content redistribution rights, download rights or permission to bypass access controls.

Every provider in this collection remains `PROVIDER_PENDING` until its own authority, network behavior, terms, license/provenance and credential requirements are reviewed. A collection-level package license cannot silently authorize third-party endpoints/content.

## Security/privacy rules
- Never copy cookies, bearer tokens, account credentials, private playlists or secret configuration from provider modules.
- Do not preserve anti-bot, paywall, DRM or authentication bypass behavior.
- Do not route media through a 4BA/GitHub proxy.
- Health/playability probes must be bounded, respectful of source terms and store no PII.
- Provider test fixtures committed to 4BA must use synthetic/public-authorized data rather than captured secrets.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING**.
The provider testing methodology may be independently reimplemented against 4BA Provider SDK contracts. Individual provider implementations require separate admission evidence.

## Evidence-bounded closure
The authoritative bundle establishes the collection topology, package version, parser dependency family and explicit provider/catalog/playability test surfaces. It does **not** establish a verified root license or per-provider authorization/terms. A package-level MIT declaration cannot authorize third-party endpoints, media, manifests, credentials or redistribution.

That missing evidence is decisive for runtime admission, so Phase 1 closes this source fail-closed rather than treating technical playability as permission. No provider implementation, target URL, captured token/cookie, playlist, anti-bot flow, media relay, download behavior or bypass logic is admitted from this collection.

The reusable result is limited to clean-room contracts and test methodology: provider registry/capability discovery, bounded health checks, deterministic catalog/provider qualification, timeout/failure isolation and synthetic/public-authorized fixtures. Any future provider must enter through the independent 4BA Provider Authorization Gate.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE only. Provider runtime: REJECTED pending independent provider-specific authorization. Direct implementation reuse: NOT GRANTED.**
