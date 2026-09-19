# Source Evidence Card: getChanelFraom_dlstreams-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- JS/JSON live-TV tool in the authoritative 30-project corpus.
- Primary evidence domain: channel normalization and health inputs.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized live metadata/channel and bounded health concepts are candidates for 4BA-owned contracts.

## Live architecture boundary
- `LiveMetadataProvider` owns canonical channel identity, schedules and EPG metadata.
- `LiveStreamProvider` owns separately authorized playback candidates.
- Playlist reachability or EPG metadata never proves stream authorization.
- Channel identity remains provider-independent so outages cannot erase favorites/history.
- Health is local, bounded and Zero-PII; it cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target/playlist/stream remains independently `PROVIDER_PENDING` until provenance, redistribution/stream authority, license/terms and credential behavior are proven. Public reachability is not an authorization grant. No private playlists, cookies, bearer tokens, captured credentials, relay/proxy behavior or bypass behavior is migrated.

## Evidence-bounded closure
The authoritative bundle establishes enough evidence to classify the source and its useful architecture without executing unresolved stream targets. Compatible root reuse rights and stream redistribution authority are not established. 4BA therefore closes the source audit fail-closed rather than treating runtime probing as proof of legitimacy.

No playlist URL, stream endpoint, credential, token, cookie, private configuration, ad/tracking behavior, proxy/relay path or provider runtime is migrated. The retained clean-room concepts are canonical channel normalization, provider-independent identity, bounded health inputs and source-outage isolation. The excluded implementation contributes zero mandatory backend cost.

A future provider must enter through the 4BA Provider SDK and independently prove authorization, licensing, ZERO_COST, Zero-PII, Native Playback compatibility and separate Watch/Download capabilities.

## Migration decision
Migration mode: **CONTRACT_REFERENCE**. Runtime provider remains independently **PROVIDER_PENDING**. Direct code/runtime reuse is blocked under current evidence.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE / PROVIDER_PENDING. Direct reuse: BLOCKED.**
