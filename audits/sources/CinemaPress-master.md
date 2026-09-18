# Source Evidence Card: CinemaPress-master

Status: DEEP_AUDIT_PARTIAL / REFERENCE_ONLY

## Authoritative bundle evidence
- Node/EJS/Express CMS/catalog project in the authoritative corpus.
- Inventory also identifies a bundled binary copy, which is not treated as source evidence or reusable implementation.
- Its architectural role is CMS/catalog/reference, not playback Provider or required Experience.

## 4BA relevance
Classification: **Engine + Reference**.
Potential clean-room value: content administration/catalog modeling, server-rendered information architecture and separation between editable catalog data and client presentation.

## Constitution boundaries
- CMS/backend cannot become mandatory for core 4BA operation.
- Bundled binaries are not executed or migrated.
- Server-rendered UI is not a substitute for native mobile/TV Experiences.
- Catalog metadata remains separate from Stream capabilities.
- Authentication/admin surfaces require independent security review and cannot collect unnecessary PII.
- Ads/tracking and third-party assets are excluded unless independently cleared.

## Migration decision
Migration mode: **CONTRACT_REFERENCE**. No CMS runtime dependency is admitted.

## Remaining evidence
Verify package manifest/lockfile, root license/provenance, Express routes/middleware, persistence/database assumptions, admin/auth surfaces, input validation, tests, secrets/config, ads/tracking and binary provenance.
