# Source Evidence Card: SportFree-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- sports/provider backend in the authoritative 30-project corpus.
- Primary evidence domain: sports/live normalization and fallback concepts.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized sports/live metadata, match/channel identity, health and fallback contracts are candidates for independent 4BA implementation.

## Live architecture boundary
- `LiveMetadataProvider` owns channel identity, schedules, EPG and match metadata.
- `LiveStreamProvider` owns authorized playback candidates.
- EPG/schedule metadata never proves stream authorization.
- Channel identity must remain canonical and provider-independent so outages do not erase favorites/history.
- Health is local/bounded and cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target/playlist/stream remains `PROVIDER_PENDING` until provenance, redistribution/stream authority, license/terms and credential behavior are independently verified. Public reachability is not an authorization grant. No private playlists, cookies, bearer tokens, captured credentials, media relay, bypass behavior or mandatory backend runtime is migrated.

## Migration decision
Migration mode: **CONTRACT_REFERENCE**. Production provider/runtime admission remains separately `PROVIDER_PENDING`; this audit card does not enable it.

## Evidence-bounded closure
The authoritative corpus is sufficient to classify SportFree as a sports/live provider backend and to bound its useful architectural ideas around metadata normalization, candidate fallback and outage isolation. It does not establish compatible root reuse rights or stream/content redistribution authority. Those are hard admission gates, not missing implementation details.

4BA therefore closes this source fail-closed. No endpoint, playlist, stream target, credential, cookie, token, private configuration, scraper/extractor, proxy/media relay, ad/tracking behavior or provider runtime is migrated. Runtime cost of the excluded implementation is zero. Generic fallback and health concepts may be reimplemented clean-room behind canonical Provider SDK contracts without coupling UI or metadata identity to a source.

Any future SportFree-derived or equivalent runtime provider must independently prove authorization, compatible licensing, ZERO_COST operation, Zero-PII/privacy compliance, Native Playback compatibility and safe network behavior before admission.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Direct/runtime reuse BLOCKED; production provider remains PROVIDER_PENDING.**
