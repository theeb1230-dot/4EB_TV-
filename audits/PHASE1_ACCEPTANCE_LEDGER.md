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
| Anthology | Provider/Engine | P package MIT; root LICENSE pending | V test/parser dependency signals | P per-provider targets | P secrets/config patterns pending | P | V catalog/provider/playability scripts | B production until per-provider authorization |
| Al-Qahtani | Provider/Engine/Ref | P root/provenance | V Flutter/Node signals | V fallback/hardening runtime | B IP/address telemetry excluded; config scan pending | B inherited ads/tracking excluded | V legacy bridge; relay/primary WebView excluded | B relay; reference only |
| turkish-series | Provider/Engine | P data provenance/license | P Android/Python/data manifests | P static/update/provider paths | P config scan | P | P provider pending | B runtime until provenance/auth |
| xoxixoxi | Provider/Engine | P | V Puppeteer/ffmpeg signals | P extraction/network targets | P process/config scan | P | B runtime extraction unapproved | B contract reference only |
| Ytvplus2 | Provider/Engine | P | P | P per-source | P secrets/config pending | P | V aggregation/fallback concept | B production pending auth |
| Mstch_Server2 | Provider/Ref | P | P | P sports targets | P | P | V live metadata/stream split | B production pending auth |
| Match-Archive | Provider/Ref | P | P | P archive targets | P | P | V live metadata/stream split | B production pending auth |
| kiro-drama | Provider/Ref | P | P JS/JSON | P per-source | P config pending | P | P capability surface | B production pending auth |
| alooytv-addon | Provider/Ref | P | P Node/Stremio | P per-source | P config pending | P | P capability surface | B production pending auth |
| ARB-S33-3 | Provider/Ref | P | P Node/Stremio | P ArabSeed-oriented per-source behavior | P config pending | P | P capability surface | B production pending auth |
| Filmex | Experience/Ref | B no LICENSE/NOTICE/COPYING in bundle | V pubspec + lockfile + Android deps | V Firebase/Google/Drive network coupling | B Firebase identity/token/cloud coupling excluded from Core | B google_mobile_ads + AdMob manifest config excluded | B WebView-first/Drive preview + third-party cookies excluded; no VideoPlayer usage found | V AUDIT COMPLETE — EXPERIENCE_REFERENCE only |
| getChanelFraom_dlstreams | Provider/Ref | P | P | P playlist targets | B private credentials/playlists excluded | P | V live metadata/stream split | B production pending auth |
| NuvioStreamsAddon | Provider/Engine | P | P Node/addon | P per-source | P config pending | P | P aggregation/capabilities | B production pending auth |
| YacinTv | Provider/Ref | P | P | P playlist targets | B private credentials/playlists excluded | P | V live metadata/stream split | B production pending auth |
| TRK_S | Provider/Ref | P | P Stremio | P per-source | P config pending | P | P capability surface | B production pending auth |
| orien.live | Quarantine | B | B | B | B credential-discovery risk | P | B | B |
| SportFree | Provider/Ref | P | P | P sports targets | P | P | V live metadata/stream split | B production pending auth |
| stremio-akwam.X | Provider/Engine | P | P Python/FastAPI | P per-source | P config pending | P | P Stremio capability surface | B production pending auth |
| CinemaPress | Engine/Ref | V MIT + exact public snapshot match | V package manifest; no lockfile | V Express/CMS/API/network surfaces | B embedded default API credentials + IP/WHOIS/geolocation/cookies excluded | B ad/prebid/advertising surfaces excluded | B server/embed/iframe/CinemaPlayer runtime excluded | V AUDIT COMPLETE — CONTRACT_REFERENCE only |
| Cannels-arap-streem | Provider/Ref | P | P | P playlist targets | B private credentials/playlists excluded | P | V live metadata/stream split | B production pending auth |
| kiro | Provider/Ref | P | P small source | P per-source | P config pending | P | P capability surface | B production pending auth |
| cinemalist | Experience/Ref | P | P Flutter/BLoC | P TMDB terms/key path | P key/config pending | P | B no player evidence | B experience reference pending license |
| cinextma | Experience/Ref | P | P Next/TS | P Supabase/cloud | B mandatory cloud/account excluded | P analytics scan | N/A | B experience reference pending license |
| ProxyFill | Unrelated/Ref | B no bundle LICENSE/NOTICE; V exact decisive blob match | V exact Blazor/.NET manifests + relevant deps | V Pokémon API/Drive network behavior; unrelated | B authoritative hard-coded credential proven + unsafe credential-output directive; value never recorded | V bounded scan: no selected ad/analytics/telemetry signatures | N/A | V AUDIT COMPLETE — EXCLUDED runtime |

> Mechanical reconciliation: 30/30 authoritative roots, exactly one row each. The ledger contains exactly one row per authoritative bundle root. SOURCE_MATRIX remains the canonical root-name/count authority.

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
**NOT ACCEPTED.** Classification coverage is 30/30, but the ledger still exposes material evidence gaps in the remaining PARTIAL roots. Work remains in Phase 1 and on PR #10 until those gates are resolved or explicitly evidence-backed as rejected.
