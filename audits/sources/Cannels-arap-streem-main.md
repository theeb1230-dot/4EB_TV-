# Source Evidence Card: Cannels-arap-streem-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Arabic channel JSON/source in the authoritative 30-project corpus.
- Primary evidence domain: Arabic channel taxonomy and EPG mapping.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized live metadata/channel/EPG concepts are candidates for 4BA-owned contracts.

## Live architecture boundary
- `LiveMetadataProvider` owns canonical channel identity, schedules and EPG metadata.
- `LiveStreamProvider` owns independently authorized playback candidates.
- EPG/schedule metadata never proves stream authorization.
- Channel identity remains provider-independent so outages do not erase favorites/history.
- Health is local/bounded and cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target/playlist/stream remains `PROVIDER_PENDING` until provenance, redistribution/stream authority, license/terms and credential behavior are independently verified. Public reachability is not an authorization grant. No private playlists, cookies, bearer tokens, credentials, private configuration, relay/proxy behavior or access-control bypass is migrated.

## Evidence-bounded closure
The authoritative bundle is sufficient to classify the root as an Arabic live-channel data/provider reference and establish its safe architectural contribution: provider-independent channel taxonomy and EPG mapping contracts.

Compatible root reuse rights and stream redistribution authority are not established. 4BA therefore closes direct/runtime reuse fail-closed instead of executing or reproducing unresolved live targets merely to increase audit detail. No playlist URL, stream endpoint, credential, token, cookie, private configuration, ad/tracking behavior or provider runtime is migrated. The excluded implementation adds no mandatory runtime/backend cost.

Any future Arabic live provider must enter through `LiveMetadataProvider` / `LiveStreamProvider` contracts and independently prove authorization, licensing, privacy, ZERO_COST and Native Playback compatibility. Metadata admission does not imply playback admission.

## Migration decision
Migration mode: **CLEAN_ROOM CONTRACT_REFERENCE + PROVIDER_PENDING**. No production provider is enabled by this card.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Direct/runtime reuse BLOCKED; runtime provider remains PROVIDER_PENDING.**
