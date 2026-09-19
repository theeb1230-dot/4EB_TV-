# Source Evidence Card: Mstch_Server2-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Node sports/koora backend in the authoritative 30-project corpus.
- Primary evidence domain: sports schedule/match normalization.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized sports schedule, match, channel and EPG concepts are candidates for independently implemented 4BA-owned contracts.

## Live architecture boundary
- `LiveMetadataProvider` owns canonical channel identity, schedules, EPG and match metadata.
- `LiveStreamProvider` owns independently authorized playback candidates.
- Schedule/EPG reachability never proves stream authorization or redistribution rights.
- Match/channel identity remains canonical and provider-independent so provider outages do not erase favorites, reminders or history.
- Health is local/bounded and cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target, playlist and stream remains `PROVIDER_PENDING` until provenance, redistribution/stream authority, license/terms and credential behavior are independently verified. Public reachability is not an authorization grant. No private playlists, cookies, bearer tokens, credentials, endpoints or captured configuration are migrated.

## Migration decision
Migration mode: **CONTRACT_REFERENCE + PROVIDER_PENDING**. No production provider is enabled by this card. Direct code/runtime reuse is blocked under current evidence.

## Evidence-bounded closure
The authoritative corpus is sufficient to classify the root as a Node sports/koora backend and to identify schedule/match normalization as its useful architectural signal. It does not establish compatible root reuse rights or authorization for any playback target. Those are decisive admission gates, not reasons to execute unresolved streams merely to accumulate more audit detail.

4BA therefore closes this source fail-closed. No stream/playlist endpoint, credential, token, cookie, private configuration, media relay, ad/tracking behavior or backend runtime is migrated. The retained clean-room value is limited to canonical match/schedule/channel models and the strict metadata-versus-stream capability boundary. Because the unresolved runtime is excluded, it creates no mandatory backend cost for Core.

Any future sports provider must be reviewed independently for authorization, licensing, ZERO_COST, Zero-PII, Native Playback compatibility and bounded health/fallback behavior.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Runtime provider remains PROVIDER_PENDING; direct/runtime reuse BLOCKED.**
