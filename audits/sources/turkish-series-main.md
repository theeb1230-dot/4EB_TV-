# Source Evidence Card: turkish-series-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / DATA_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Very large corpus: roughly 18,082 files.
- Mixed Android/Kotlin + Python + large JSON/data footprint.
- GitHub Pages/static data publication and scheduled-update signals are present.
- The scale itself is an architectural warning: mutable catalog data must not be compiled wholesale into 4BA Core.

## 4BA relevance
Classification: **Provider + Engine + Reference**, with strongest value as Turkish vertical/data-pipeline reference.
Useful concepts: static zero-cost metadata publication, freshness/version markers, client/data separation and Turkish catalog normalization.

## Constitution boundaries
- Static hosting may distribute authorized metadata/config artifacts only; GitHub Pages is never a media relay.
- Dataset presence does not establish data/content redistribution rights.
- Large mutable JSON catalogs belong behind cache/data adapters, not canonical domain code or app binaries.
- Stream/provider capabilities are independently authorization-gated.
- Update jobs must fail safely and retain last-known-good authorized data.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING**. Data/update concepts may be clean-room implemented after provenance/schema/freshness evidence.

## Evidence-bounded closure
The authoritative corpus proves the architectural shape and, equally importantly, proves that 4BA must not treat this mutable dataset as trusted application source. Root/data redistribution provenance and provider/content authorization are not established by the bundle. Those missing rights are decisive: direct dataset/code migration and runtime provider admission fail closed.

The large JSON/data footprint is not copied into Core or app binaries. No endpoint, credential, provider target, stream reference or mutable catalog payload is admitted. Scheduled/static publication is retained only as a clean-room pattern for authorized metadata/config snapshots with explicit schema/version/freshness markers, bounded client caches, atomic replacement and last-known-good rollback.

The Android/Python/data mix is therefore sufficient for a Phase-1 architectural decision without pretending unresolved data rights are a future production entitlement. Any future Turkish metadata source must pass the normal provider/metadata authorization gate independently.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE + DATA_REFERENCE. Direct reuse: BLOCKED. Runtime provider: PROVIDER_PENDING and disabled.**
