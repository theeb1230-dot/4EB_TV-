# Source Evidence Card: CinemaPress-master

Status: DEEP_AUDIT_COMPLETE / CONTRACT_REFERENCE_ONLY

## Authoritative snapshot / provenance
- Authoritative Drive bundle root contains 1,199 entries including AppleDouble metadata; the actual CinemaPress source tree is a Node/EJS/Express CMS/catalog project.
- Bundle Git blob SHA-1 values exactly match public `CinemaPress/CinemaPress` master at commit `2a9d3fa4bcd9cb92ce031b3e7324f1d7e76050b5` for the decisive provenance files:
  - `package.json` -> `8165c15e4fb589b75f6c483083640ef1a8d5c78c`
  - `LICENSE.txt` -> `e3d166b0f534881e683eb01991c8409d2090c47c`
  - `README.md` -> `1973a64596b1cf3348ff6e8b40a68314c05936e7`
  - `app.js` -> `24e9d6475a81df8ae94ed2c62d9992923e128e7c`
- Package version is `5.0.0`.

## License / reuse
- Root `LICENSE.txt` is MIT and matches the public repository blob.
- License compatibility alone does not make this runtime desirable for 4BA. Product-constitution, privacy, ads, player, backend and security boundaries below still prohibit direct runtime adoption.
- No third-party theme/assets/dependency redistribution is implicitly cleared by the root MIT license; each external dependency/asset remains subject to its own terms if ever considered.

## Technology / architecture / dependencies
- Node.js + Express 4.17.1 + EJS 3.1.6 server-rendered CMS.
- MySQL, PM2, request/axios, Cheerio, Sharp, Nodemailer/IMAP, MaxMind/whois, cookies, multer, React 16 support surfaces, Telegram bot API, proxy/cookie-jar helpers and other server/runtime dependencies are declared.
- No `package-lock.json` is present in the authoritative root, so dependency resolution is not reproducibly locked.
- No test/spec directory or conventional test files were found in the authoritative root.
- Production config directory contains only `.gitkeep`; defaults live under locale/default config/module files and are expected to be materialized/configured by the CMS.

## Routes / runtime surfaces
Authoritative Express routes include admin, API, website, files, episode, RSS, OpenSearch, robots, Telegram, iframe/embed, player and CinemaPlayer routes.
- `app.js` mounts admin and player/CinemaPlayer/iframe-style server surfaces.
- Admin/config code handles editable runtime configuration, API/module settings and admin routing. This server administration model is not migrated into 4BA clients.
- Catalog/API concepts may inform clean-room contracts, but UI must continue to depend only on canonical 4BA Core/Metadata/Provider interfaces.

## Metadata / APIs / network
- Default config references external metadata/media-related services including TMDB, TVMaze, YouTube and other optional endpoints.
- Default modules contain non-empty third-party API credentials/keys in source configuration. **Values are intentionally not copied into 4BA documentation or commits.**
- Runtime uses outbound HTTP clients and supports configurable API/player endpoints.
- A public repository or included key does not grant 4BA API authorization. Every future metadata integration remains separately terms/authorization gated and cannot become a mandatory paid dependency.

## Privacy / Zero-PII findings
- `lib/CP_userinfo.js` collects/derives client IP information from request/forwarding headers and uses MaxMind/WHOIS/geolocation/ASN logic.
- Runtime sets multiple cookies and uses country/IP/whois information for routing/blocking/behavior.
- Player/embed paths can include IP-derived fields/hashes.
- These behaviors are incompatible with 4BA Zero-PII/privacy-first defaults and are **EXCLUDED**. 4BA health telemetry remains local/anonymous/optional only.

## Ads / tracking
- Authoritative root contains advertising-oriented surfaces including `modules/CP_adv.js` and `themes/default/public/desktop/js/prebid-ads.js`; configuration/localization also includes advertising/module behavior.
- Regardless of whether every advertising path is enabled by default, all ad/prebid/banner/advertising behavior is **EXCLUDED** by ZERO_ADS.
- No advertising SDK, pre-roll, popup, banner or ad-tracking behavior may be migrated.

## Player / stream behavior
- Authoritative source includes `routes/player.js`, `routes/cinemaplayer.js`, `routes/embed.js`, `routes/iframe.js`, `modules/CP_player.js` and player JS assets.
- The CMS supports server-generated/embed/iframe/player orchestration and configurable remote CinemaPlayer scripts/endpoints.
- This is not compatible with 4BA Native Playback First. No CMS player, iframe-first player, server relay, provider endpoint or remote player script is migrated.
- At most, the separation of catalog information, trailer/online/download tabs and configurable presentation is a clean-room **contract reference**. Watch and Download remain separate 4BA capabilities.

## 4BA classification
Classification: **Engine + Reference**.

Useful clean-room concepts:
- editable catalog/admin modeling as an optional external tool concept,
- separation of catalog data from presentation,
- route/API shape as a negative/positive contract reference,
- locale/config organization ideas where they do not carry runtime coupling.

Not admitted:
- mandatory CMS/backend,
- server-rendered Experience,
- player/embed/iframe runtime,
- advertising stack,
- IP/WHOIS/geolocation profiling,
- bundled/default credentials,
- cookies/session behavior as a 4BA identity requirement,
- media relay/proxy,
- provider authorization inferred from configuration.

## Migration decision
Migration mode: **CONTRACT_REFERENCE** only.
- No CinemaPress runtime dependency is admitted.
- No CinemaPress source code/assets/config/secrets are copied into 4BA implementation.
- The concepts worth keeping are re-specified behind 4BA-owned contracts and Design System where useful.

## Phase-1 closure
CinemaPress now satisfies Phase-1 audit requirements as an evidence-backed **reference-only** source:
1. provenance/version: verified by four exact authoritative/public blob matches,
2. architecture: Node/Express/EJS CMS verified,
3. license: root MIT verified; direct runtime still rejected by product/security boundaries,
4. dependencies: authoritative package manifest inventoried; lockfile absence recorded,
5. network/API/cost: configurable external API/player/runtime network behavior documented; no mandatory paid service admitted,
6. secrets/privacy/telemetry/ads: embedded default API credentials noted without values; IP/WHOIS/geolocation/cookies and advertising surfaces explicitly excluded,
7. player/provider: server/embed/iframe/CinemaPlayer behavior documented and rejected for runtime reuse,
8. migration destination: CONTRACT_REFERENCE only,
9. risks/clean-room boundary: explicitly documented above.

No tests were found in the authoritative source, which is recorded as evidence rather than silently treated as passing validation.
