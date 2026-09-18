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


## Repository hygiene finding

A raw third-party archive `CinemaPress-master.zip` (24,121,537 bytes) is currently committed at the root of this audit branch. This violates the established clean-room audit boundary: third-party implementation archives are evidence inputs, not 4BA source artifacts.

Required remediation before PR merge:
- remove the archive from the 4BA branch/repository history path used for product development;
- retain only evidence notes/hashes/provenance references needed for audit accountability;
- do not execute or redistribute the bundled binary/source archive from 4BA;
- continue file-level inspection from the authoritative external evidence source when tooling permits.

The archive's repository presence is **not** license or reuse approval.
