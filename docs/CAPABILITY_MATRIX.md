# 4BA Capability Matrix

Status: Phase 1 evidence matrix. A check here means the source tree shows a capability signal; it does **not** mean production code is approved for reuse.

| Capability | 4BA owner | Aniyomi | AIOStreams | FlixQuest | AIOMetadata | Gate before implementation |
|---|---|---|---|---|---|---|
| Domain/data separation | Core | Verified source/domain/data boundaries | Verified staged core pipeline | Provider/service/model separation verified | Backend/configure split verified | Continue dependency audit |
| Provider/source contracts | Provider SDK | AnimeSource contract verified | Aggregation pipeline only; restricted behaviors excluded | Provider loader/tests signal | Addon API resource boundary | License + contract audit |
| Metadata normalization | Metadata Engine | core-metadata signal | Stream-side parsing only | Movie/TV metadata models | Network alias/index normalization verified | Schema/mapping audit |
| Resolver/aggregation | Resolver | Hoster -> video candidate separation verified | Filter/sort/dedup pipeline verified clean-room only | Provider-order/player tests signal | Metadata-only boundary preferred | Behavior/test audit |
| Native client UX | Experience Engine | Android reference | N/A/backend-oriented | Flutter primary candidate | Configure/web only | UX/code audit |
| TV/focus | Experience Engine | Pending | N/A | Priority inspection | N/A | D-pad evidence |
| Cast | Player | Pending | N/A | cast_receiver + player integration evidence | N/A | Protocol/platform audit |
| Localization | Core | i18n modules confirmed | Pending | Pending | Pending | AR/EN/TR strategy |
| Performance testing | Quality | macrobenchmark confirmed | Pending | test tree | Pending | Test-content audit |
| Remote configuration | Config | Pending | env/config signal | API schema signal | configure signal | Signed config design |
| Offline/local source | Storage | source-local confirmed | N/A | Queue lifecycle/progress provider verified | Cache/database integration signal | Persistence audit |

## Rules
4BA owns every production contract. Third-party projects provide evidence and ideas, not runtime coupling. UI never binds directly to a provider. Metadata and streams remain separate. ZERO_COST, ZERO_ADS, Privacy/Zero-PII and Native Playback First override inherited implementation choices.
