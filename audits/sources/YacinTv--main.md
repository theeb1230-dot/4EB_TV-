# Source Evidence Card: YacinTv--main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- small JS/JSON live-TV source in the authoritative 30-project corpus.
- Primary evidence domain: channel model/EPG compatibility.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized live metadata/channel/match concepts are candidates for 4BA-owned contracts.

## Live architecture boundary
- `LiveMetadataProvider` owns channel identity, schedules, EPG and match metadata.
- `LiveStreamProvider` owns authorized playback candidates.
- EPG/schedule metadata never proves stream authorization.
- Channel identity must remain canonical and provider-independent so outages do not erase favorites/history.
- Health is local/bounded and cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target/playlist/stream remains `PROVIDER_PENDING` until provenance, redistribution/stream authority, license/terms and credential behavior are verified. Publicly reachable playlist data is not an authorization grant. No private playlists, cookies, bearer tokens or captured credentials are migrated.

## Migration decision
Migration modes: **CONTRACT_REFERENCE + PROVIDER_PENDING**. No production provider is enabled by this card.

## Evidence-bounded closure
The authoritative bundle is sufficient to classify this root as a small JS/JSON live-TV provider/data reference and to establish the only constitution-safe migration boundary: canonical channel/EPG concepts may be independently modeled, while every playlist/stream/network target remains separately authorization-gated.

The bundle does not establish compatible root reuse rights or stream redistribution authority. Rather than execute or reproduce unresolved live targets merely to increase audit detail, 4BA closes this root fail-closed. No playlist URL, token, cookie, credential, private configuration, stream endpoint, ad/tracking behavior or provider runtime is migrated. Runtime cost is therefore zero for the excluded implementation.

A future live provider must enter through `LiveMetadataProvider` / `LiveStreamProvider` contracts and independently prove authorization, licensing, privacy, ZERO_COST and Native Playback compatibility.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Runtime provider remains PROVIDER_PENDING; direct reuse BLOCKED.**
