# 4BA Provider Matrix

Status: Phase 1 provisional evidence matrix.

| Source | Provider/engine signal | Candidate 4BA destination | Approval |
|---|---|---|---|
| Aniyomi | `source-api`, `source-local` modules | Provider SDK contract/reference | Pending deep audit/license |
| AIOStreams | monorepo `packages` + configuration/deployment signals | Aggregation/Resolver reference | Pending deep audit/license |
| FlixQuest | client/API schema signal | Experience/API-consumer reference, not direct provider yet | Pending |
| AIOMetadata | addon/configure/data + backend/app TypeScript configs | Metadata Engine reference | Pending deep audit/license |

## Provider admission gate
A production provider must declare capabilities, remain replaceable, expose no secret to UI, support health/error classification, avoid mandatory paid infrastructure, avoid ads/tracking, and contain no DRM/paywall/access-control bypass. Watch and Download capabilities are represented separately.
