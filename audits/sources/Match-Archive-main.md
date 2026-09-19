# Source Evidence Card: Match-Archive-main

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE / PROVIDER_PENDING / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Node match-archive backend in the authoritative 30-project corpus.
- Primary evidence domain: historical match identifiers/archive schemas.
- This source belongs to the live/sports family and is not a client Experience.

## 4BA relevance
Classification: **Provider + Data/Reference**.
Only normalized historical-match identity, archive metadata and schedule/result concepts are candidates for independently implemented 4BA-owned contracts.

## Live architecture boundary
- `LiveMetadataProvider` owns canonical match/channel identity, schedules, EPG, status and archive metadata.
- `LiveStreamProvider` owns separately authorized playback candidates.
- Historical/archive metadata never proves replay or stream authorization.
- Canonical match identity remains provider-independent so history, reminders and favorites survive provider outages or replacement.
- Health is local/bounded and cannot leak viewer identity.
- Watch and Download remain separate capabilities.

## Admission boundaries
Every network target, replay URL, playlist or stream remains `PROVIDER_PENDING` until provenance, redistribution/replay authority, license/terms and credential behavior are independently verified. Public reachability or historical availability is not an authorization grant. No private playlist, cookie, bearer token, captured credential, bypass behavior or media relay is migrated.

## Migration decision
Migration mode: **CONTRACT_REFERENCE + PROVIDER_PENDING**. No production provider is enabled by this card. Direct code/runtime reuse is blocked under unresolved root reuse/license and authorization evidence.

## Evidence-bounded closure
The authoritative corpus establishes enough architecture to classify the source and bound its safe contribution without exercising unresolved media targets. The useful concept is a provider-independent historical match/archive model that can feed 4BA sports history and yesterday/today/future schedule surfaces while keeping playback authority separate.

The corpus does not establish compatible root reuse rights or replay/stream redistribution authority. 4BA therefore closes this source fail-closed: no endpoint, credential, cookie, token, private configuration, replay URL, stream target, provider runtime, proxy/relay, bypass behavior, ad or tracking behavior is admitted. The excluded implementation contributes zero mandatory runtime cost and cannot become a Core dependency.

Any future archive/live provider must independently prove authorization, compatible licensing, ZERO_COST, Zero-PII, bounded health behavior and Native Playback compatibility through the Provider SDK admission gates.

**Phase-1 result: AUDIT COMPLETE — CONTRACT_REFERENCE. Runtime provider remains PROVIDER_PENDING; direct/runtime reuse BLOCKED.**
