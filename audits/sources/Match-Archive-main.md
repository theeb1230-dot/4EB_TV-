# Source Evidence Card: Match-Archive-main

Status: DEEP_AUDIT_PARTIAL / PROVIDER_PENDING

## Authoritative bundle evidence
- Node match-archive backend in the authoritative 30-project corpus.
- Primary evidence domain: historical match identifiers/archive schemas.
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

## Remaining evidence
Verify manifests/source entry points, representative schemas, root license/provenance, network targets, EPG mapping, health/fallback logic, tests, secret/config loading, ads/tracking and runtime cost.
