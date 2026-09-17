# 4BA Source Matrix

This is the audit queue. Classification is provisional until code, dependencies and licenses are verified. A source may contribute to multiple categories.

| # | Source | Initial classification | Primary audit focus | Status |
|---|---|---|---|---|
| 01 | cinemalist-official-master | Experience / Reference | Flutter discovery UI, TMDB/BLoC | Pending deep audit |
| 02 | cinextma-master | Experience / Engine | Next.js UX, Supabase boundaries | Pending deep audit |
| 03 | ARB-S33-3-main | Provider | ArabSeed/Stremio contracts | Pending deep audit |
| 04 | Cinemax-main | Experience / Reference | Android/Kotlin architecture and UX | Pending deep audit |
| 05 | ProxyFill-main | Reference / Outlier | Relevance and licensing | Pending deep audit |
| 06 | Mstch_Server2-main | Provider | Sports scraper/data contracts | Pending deep audit |
| 07 | Match-Archive-main | Provider | Match archive contracts | Pending deep audit |
| 08 | kiro-drama-main | Provider | Drama catalog/source behavior | Pending deep audit |
| 09 | alooytv-addon-main | Provider | Stremio addon contract | Pending deep audit |
| 10 | Filmex-main | Experience / Reference | Flutter UI patterns | Pending deep audit |
| 11 | getChanelFraom_dlstreams-main | Provider / Tool | Live channel data | Pending deep audit |
| 12 | anthology-main | Provider / Engine / Reference | Turkish addon ecosystem, health/tests | Pending deep audit |
| 13 | Al-Qahtani-main | Experience / Provider / Engine | Arabic/sports/provider migration | Pending deep audit |
| 14 | NuvioStreamsAddon-master | Provider / Engine | Aggregation architecture | Pending deep audit |
| 15 | AIOStreams-main | Engine / Provider / Reference | Provider aggregation/capabilities | Pending deep audit |
| 16 | aniyomi-main | Engine / Experience / Reference | Extensions, player, source architecture | Pending deep audit |
| 17 | YacinTv--main | Provider | Live TV data/source | Pending deep audit |
| 18 | xoxixoxi-main | Provider / Engine | Backend scraper dependencies and risk | Pending deep audit |
| 19 | TRK_S-main | Provider | Turkish Stremio source | Pending deep audit |
| 20 | orien.live-main | Reference / Security risk | Credential exposure/staleness; never copy secrets | Pending deep audit |
| 21 | Ytvplus2-main | Provider / Engine | Multi-source backend | Pending deep audit |
| 22 | SportFree-main | Provider | Sports backend | Pending deep audit |
| 23 | flixquest-main | Experience / Reference | Flutter adaptive Mobile/TV shell | Pending deep audit |
| 24 | stremio-akwam.X-main | Provider / Engine | FastAPI Akwam provider contract | Pending deep audit |
| 25 | CinemaPress-master | Experience / Reference | CMS/catalog concepts, legacy stack | Pending deep audit |
| 26 | Cannels-arap-streem-main | Provider | Arabic live channel data | Pending deep audit |
| 27 | CineSpot-main | Experience / Reference | Flutter discovery/search/watchlist UX | Pending deep audit |
| 28 | aiometadata-dev | Engine | Metadata aggregation/mapping | Pending deep audit |
| 29 | turkish-series-main | Provider / Engine / Reference | Turkish dataset/update architecture | Pending deep audit |
| 30 | kiro-main | Provider | Source behavior | Pending deep audit |

## Required audit card per source

For every source record: provenance/version, language/framework, architecture, UI/UX, features, data models, APIs/contracts, player behavior, providers, dependencies, update mechanism, tests, performance concerns, network/security behavior, secrets scan, advertising/tracking scan, license and redistribution constraints, reusable code, reusable clean-room concepts, 4BA destination, migration strategy, risk rating, and evidence paths.

## Gate

No source implementation is merged into 4BA Core merely because it works in isolation. It must pass license/security review and be adapted behind 4BA contracts. Providers never bind directly to UI. Credentials are never copied. Advertising/tracking is rejected. DRM/paywall/access-control bypass is rejected.
