# 4BA Capability Matrix

Status: Phase 1 evidence matrix. A check here means the source tree shows a capability signal; it does **not** mean production code is approved for reuse.

| Capability | 4BA owner | Aniyomi | AIOStreams | FlixQuest | AIOMetadata | Gate before implementation |
|---|---|---|---|---|---|---|
| Domain/data separation | Core | Strong module signal | Package signal | Pending code | Backend/app split signal | Inspect interfaces |
| Provider/source contracts | Provider SDK | source-api signal | packages signal | Pending | addon signal | License + contract audit |
| Metadata normalization | Metadata Engine | core-metadata signal | Pending | API consumer signal | Primary candidate | Schema/mapping audit |
| Resolver/aggregation | Resolver | Pending | Primary candidate | Pending | Metadata-only boundary preferred | Behavior/test audit |
| Native client UX | Experience Engine | Android reference | N/A/backend-oriented | Flutter primary candidate | Configure/web only | UX/code audit |
| TV/focus | Experience Engine | Pending | N/A | Priority inspection | N/A | D-pad evidence |
| Cast | Player | Pending | N/A | cast_receiver confirmed | N/A | Protocol/platform audit |
| Localization | Core | i18n modules confirmed | Pending | Pending | Pending | AR/EN/TR strategy |
| Performance testing | Quality | macrobenchmark confirmed | Pending | test tree | Pending | Test-content audit |
| Remote configuration | Config | Pending | env/config signal | API schema signal | configure signal | Signed config design |
| Offline/local source | Storage | source-local signal | N/A | Pending | data signal | Persistence audit |

## Rules
4BA owns every production contract. Third-party projects provide evidence and ideas, not runtime coupling. UI never binds directly to a provider. Metadata and streams remain separate. ZERO_COST, ZERO_ADS, Privacy/Zero-PII and Native Playback First override inherited implementation choices.
