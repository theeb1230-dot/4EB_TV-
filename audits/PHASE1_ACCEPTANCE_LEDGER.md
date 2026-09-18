# Phase 1 Acceptance Ledger

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`
Purpose: prevent architectural classification from being mistaken for a completed Deep Audit.

Legend: **V** verified evidence, **P** partial/pending deeper evidence, **B** blocked/rejected for direct reuse.

| Source | Class | License | Dependencies | Network/API | Secrets/privacy | Ads/tracking | Player/provider | Reuse gate |
|---|---|---|---|---|---|---|---|---|
| aniyomi | Ref/Experience | V Apache-2.0 snapshot | P | P | P | P | V source->hoster->video | P |
| AIOStreams | Engine/Provider | B MIT/GPL conflict | P | P | P | P | V generic pipeline; restricted behaviors excluded | B |
| flixquest | Experience/Ref | V GPL-3.0 | V major pubspec | P | V telemetry deps identified | V ad/analytics deps excluded | V player/offline tests | B direct code |
| aiometadata | Metadata/Engine | B Apache/GPL conflict | P | V metadata/cache surfaces | P | P tracking coupling identified | N/A | B |
| Cinemax | Experience/Ref | V Apache-2.0 | V major version catalog | V network/db + INTERNET/NETWORK_STATE | V API-key external config pattern | P | B no player evidence | P NOTICE/assets/API terms |
| CineSpot | Experience/Ref | B no license file in bundle | V major pubspec | P Dio/Retrofit + cloud deps | V Firebase config/coupling; values not recorded | P | P YouTube/WebView deps | B direct reuse |
| Anthology | Provider/Engine | P package says MIT | P | P per provider | P | P | V provider/playability tests | P per provider |
| Al-Qahtani | Provider/Engine/Ref | P | P | V fallback/probe/relay | P | P | V relay excluded | P |
| turkish-series | Provider/Engine | P | P | P | P | P | P | P |
| xoxixoxi | Provider/Engine | P | P backend tooling | P | P | P | P | P |
| Ytvplus2 | Provider/Engine | P | P | P | P | P | P | P |
| Mstch_Server2 | Provider/Ref | P | P | P | P | P | P | P |
| Match-Archive | Provider/Ref | P | P | P | P | P | P | P |
| kiro-drama | Provider/Ref | P | P | P | P | P | P | P |
| alooytv-addon | Provider/Ref | P | P | P | P | P | P | P |
| Filmex | Experience/Ref | P | P | P | P | P | P | P |
| getChanelFraom_dlstreams | Provider/Ref | P | P | P | P | P | P | P |
| NuvioStreamsAddon | Provider/Engine | P | P | P | P | P | P | P |
| YacinTv | Provider/Ref | P | P | P | P | P | P | P |
| TRK_S | Provider/Ref | P | P | P | P | P | P | P |
| orien.live | Quarantine | B | B | B | B credential-discovery risk | P | B | B |
| SportFree | Provider/Ref | P | P | P | P | P | P | P |
| stremio-akwam.X | Provider/Engine | P | P | P | P | P | P | P |
| CinemaPress | Engine/Ref | P | P | P | P | P | N/A | P |
| Cannels-arap-streem | Provider/Ref | P | P | P | P | P | P | P |
| kiro | Provider/Ref | P | P | P | P | P | P | P |
| cinemalist | Experience/Ref | P | P | P | P | P | P | P |
| cinextma | Experience/Ref | P | P | P | P cloud coupling signal | P | N/A | P |
| ProxyFill | Unrelated/Ref | P | P | N/A | P | P | N/A | B runtime |

> The ledger contains exactly one row per authoritative bundle root. SOURCE_MATRIX remains the canonical root-name/count authority.

## Phase 1 acceptance criteria
Phase 1 can close only when every 30-root source has:
1. provenance/version evidence,
2. technology/architecture classification,
3. explicit license/reuse decision,
4. dependency inventory at the level relevant to reuse,
5. network/API behavior and paid-service implications,
6. secrets/privacy/telemetry/ad scan,
7. player/provider behavior where applicable,
8. migration destination or explicit exclusion,
9. documented risks and clean-room boundary.

A provider may remain **rejected/quarantined** and still satisfy audit completion if the rejection is evidence-backed. Audit completion never means provider approval.

## Current decision
**NOT ACCEPTED.** Classification coverage is 30/30, but the ledger exposes material evidence gaps. Work must remain in Phase 1 and on PR #10 until these gates are resolved or explicitly evidence-backed as rejected.
