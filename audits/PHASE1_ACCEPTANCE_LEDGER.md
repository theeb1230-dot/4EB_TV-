# Phase 1 Acceptance Ledger

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`
Purpose: prevent architectural classification from being mistaken for a completed Deep Audit.

Legend: **V** verified evidence, **P** partial/pending deeper evidence, **B** blocked/rejected for direct reuse.

| Source | Class | License | Dependencies | Network/API | Secrets/privacy | Ads/tracking | Player/provider | Reuse gate |
|---|---|---|---|---|---|---|---|---|
| aniyomi | Engine/Experience/Ref | V Apache-2.0 root; file/native obligations gated | V Gradle catalogs + source/app dependency families | V HTTP/source boundaries + manifest network permissions bounded | V no secrets copied; commented crash-credential pattern excluded | V bounded search found no named ad/common analytics SDK admitted | V source->hoster->video + native player/download; torrent/external player/WebView-primary excluded | V AUDIT COMPLETE — contract/Android reference; direct reuse deferred |
| AIOStreams | Engine/Provider | B MIT/GPL conflict | V workspace/Core/Server/Frontend manifests | V config/network/runtime boundaries bounded | V secret/operator/logging surfaces excluded | V bounded manifest/search review; no named ad/common analytics SDK admitted | V generic pipeline; proxy/bypass/torrent/debrid/relay excluded | V AUDIT COMPLETE — clean-room contract reference; runtime rejected |
| flixquest | Experience/Ref | V GPL-3.0; direct migration blocked | V Flutter/BetterPlayer/Firebase/Mixpanel/UnityAds/cache/download families | V OpenAPI/provider/proxy + Android network/runtime boundaries; relay rejected | V telemetry/cloud identity + proxy-token/secret surfaces excluded | V Unity Ads/Firebase analytics/Mixpanel rejected | V native player/offline/download + TV loader evidence; external player/proxy excluded | V AUDIT COMPLETE — clean-room Experience only; runtime provider/proxy rejected |
| aiometadata | Metadata/Engine | B Apache/GPL conflict; direct reuse blocked | V Node/TS + Express/SQLite/PostgreSQL/Redis/React/Vite families | V metadata/cache/API credential surfaces bounded; external APIs separately gated | V env/admin/database/API credentials + account/metrics surfaces excluded | V metrics/tracking not inherited; local optional diagnostics only | V N/A for playback; metadata-provider contracts only | V AUDIT COMPLETE — clean-room metadata reference; external API admission not granted |
| Cinemax | Experience/Ref | V Apache-2.0 | V major version catalog | V network/db + INTERNET/NETWORK_STATE | V API-key external config pattern | V no admitted telemetry/ad runtime | B no player/TV evidence inferred | V AUDIT COMPLETE — direct reuse deferred; reference only |
| CineSpot | Experience/Ref | B no license file in bundle | V major pubspec | P Dio/Retrofit + cloud deps | V Firebase config/coupling; values not recorded | P | P YouTube/WebView deps | B direct reuse |
| Anthology | Provider/Engine | B package MIT but root/per-provider license provenance unresolved | V Node/Nuvio/Stremio + parser/test families | V per-provider network remains independently admission-gated | V credentials/cookies/private fixtures excluded by policy | V no ad/tracking behavior admitted from unresolved providers | V catalog/provider/playability qualification methodology | V AUDIT COMPLETE — contract reference; every runtime provider remains PROVIDER_PENDING |
| Al-Qahtani | Provider/Engine/Ref | B root reuse/provenance not established | V Flutter/Node dependency/runtime families bounded | V fallback/hardening behavior bounded; media relay rejected | V IP/address/config/credential values not inherited; Zero-PII boundary explicit | V inherited ads/tracking rejected; none admitted | V legacy bridge + video_player/WebView signals bounded; relay/external-browser/WebView-primary rejected | V AUDIT COMPLETE — clean-room contract/Experience reference; runtime/provider rejected |
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
| cinemalist | Experience/Ref | B authoritative GPL-3.0 snapshot matched | V pubspec/lock + Flutter/BLoC deps | V TMDB v3 metadata client; terms/auth separate | B non-empty default TMDB key excluded; privacy-policy IP/device log collection rejected | V bounded code scan found no selected ad/analytics SDK signatures | B YouTube trailer + url_launcher only; no movie/episode stream player | V AUDIT COMPLETE — EXPERIENCE_REFERENCE + CLEAN_ROOM only |
| cinextma | Experience/Ref | B authoritative license attribution unavailable | V authoritative Next.js/TS/Supabase inventory + public corroboration | V cloud/TMDB/PWA boundaries bounded | V env/account/cloud secrets not inherited | V Vercel telemetry excluded; no ads admitted | B no provider/player authorization inferred | V AUDIT COMPLETE — clean-room reference; direct reuse deferred |
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
**NOT ACCEPTED.** Classification coverage is 30/30, but the ledger still exposes material evidence gaps in the remaining PARTIAL roots. Work remains in Phase 1 until every remaining PARTIAL root is resolved or explicitly closed by an evidence-backed rejection/quarantine decision. AIOStreams is now closed fail-closed as clean-room/contract reference only; this does not authorize runtime/provider admission.
