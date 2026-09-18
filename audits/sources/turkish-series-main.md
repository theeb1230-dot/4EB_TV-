# Source Evidence Card: turkish-series-main

Status: DEEP_AUDIT_PARTIAL / DATA_REFERENCE

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

## Remaining evidence
Verify root license/data provenance, representative JSON schemas, update scripts/workflows, freshness/rollback behavior, Android client boundaries, network/provider code, tests, secret/config handling and dataset size strategy.
