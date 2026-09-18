# Source Evidence Card: anthology-main

Status: DEEP_AUDIT_PARTIAL / PROVIDER_PENDING

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

## Remaining evidence
Verify root LICENSE file, enumerate provider manifests/config schemas, classify network targets without recording sensitive values, inspect secret/config loading patterns, ads/tracking, authorization/terms evidence and exact test assertions/timeouts.
