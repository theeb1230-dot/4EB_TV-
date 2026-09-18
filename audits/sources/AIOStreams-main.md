# Source Evidence Card: AIOStreams-main

Status: DEEP_AUDIT_PARTIAL / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- Authoritative bundle contains `AIOStreams-main` with `packages/`, `scripts/`, `resources/`, `patches/`, `.github/`, `.vscode/`, `package.json`, `pnpm-lock.yaml`, `pnpm-workspace.yaml`, `tsconfig*.json`, `Dockerfile`, `compose.yaml`, `.env.sample`, `README.md`, `CHANGELOG.md`, and `LICENSE`.
- Bundled version is `2.32.1`.
- Authoritative package declaration says MIT while authoritative root `LICENSE` contains GPL-3.0 text. This conflict is already a hard direct-reuse blocker in `LICENSE_SECURITY_AUDIT.md`.
- No secret value from the bundle is copied into 4BA documentation or source.

## Version-matched public corroboration
Public repository `Viren070/AIOStreams` exposes tag `v2.32.1`, matching the archived package version. This is corroborating evidence until decisive bundle blobs are matched.
- Public tag `package.json` blob `625dddbdc11e020887b927e16b56d15951aa9465` declares version `2.32.1`, package license `MIT`, Node >=24, pnpm >=11 and a TypeScript pnpm workspace.
- Public tag root `LICENSE` blob is GPL-3.0, reproducing the same package-vs-root license conflict observed in the authoritative bundle.
- Public tag `.env.sample` blob `727ef38b62deda953666b8c4720649fe287a4cfd` documents a required base URL, required encryption secret, SQLite/PostgreSQL database URI, optional Redis, operator authentication/permissions, logging, runtime settings, proxy/debrid/service credentials and caches. Example placeholders are evidence only; no secret value is inherited.
- Public tag `packages/server/package.json` blob `2d19b54b735dfb02d4479da724ba89cba9874931` declares Express, rate limiting, Redis-backed rate limiting, multipart handling, Undici and Zod, with Vitest test scripts.
- Public tag `packages/core/package.json` blob `09771ca2ce3b1836544148f0793c0e4504d47dc9` declares SQLite/PostgreSQL/Redis, OpenID, torrent parsing, SOCKS fetching, WebDAV, StremThru, logging, XML parsing and provider/service-oriented dependencies, with core test scripts.

## Architecture / 4BA relevance
Classification: **Engine + Provider + Reference**.
Useful clean-room concepts:
- staged normalization/filtering/sorting/deduplication,
- explicit configuration schema and validation,
- provider/service failure isolation,
- bounded cache/rate-limit concepts,
- optional single-instance vs scaled runtime behavior,
- testable Core/Server package boundaries.

These concepts belong behind 4BA-owned Provider SDK / Resolver contracts. No AIOStreams implementation is imported into Core or UI.

## Security / constitution boundary
- The versioned public package description explicitly states support for proxying streams and IP-restriction bypassing. These behaviors are **EXCLUDED** from 4BA.
- Torrent/Usenet/debrid/native service/proxy behavior is not a 4BA core capability and is not enabled by this audit.
- Public `.env.sample` requires a cryptographic secret for stored configuration and supports operator credentials. 4BA does not copy those credentials, secrets or its server authentication model.
- Redis/PostgreSQL/Docker/Compose are optional infrastructure references only; none may become a mandatory paid/core runtime dependency. Local-first operation remains required.
- Any provider, addon, debrid or stream service remains independently authorization-gated. Technical compatibility or public source does not prove content rights.
- Logging/configuration paths require further authoritative privacy/telemetry review before this root can be called audit-complete.

## License / reuse decision
The authoritative package-vs-root license conflict is fail-closed. Current migration modes are **CLEAN_ROOM_BEHAVIOR + CONTRACT_REFERENCE** only.
- No direct code/assets reuse is authorized.
- No GPL implementation is copied into the current 4BA implementation path.
- The public `v2.32.1` tag strengthens version correlation but does not substitute for authoritative blob provenance matching.

## Player / provider boundary
- AIOStreams is an aggregation/provider engine reference, not a selectable 4BA Experience or player implementation.
- Metadata, Streams and Download remain separate 4BA capabilities.
- Resolver output must be canonical candidates with local health/fallback; UI never consumes AIOStreams-specific models.
- No proxy relay through 4BA/GitHub is permitted.

## Migration decision
Migration modes: **CLEAN_ROOM_BEHAVIOR + CONTRACT_REFERENCE**. Restricted proxy/IP-bypass, torrent/Usenet/debrid and media-relay behavior is excluded.

## Remaining Phase-1 evidence
1. Match decisive authoritative `package.json`, root LICENSE, workspace manifest and representative Core/Server blobs against `v2.32.1` or record divergence.
2. Close authoritative dependency inventory at the package level relevant to 4BA concepts.
3. Inspect authoritative network targets/config loading without exposing credentials.
4. Inspect authoritative telemetry/analytics/privacy and advertising surfaces.
5. Inspect authoritative filtering/ranking/dedup/fallback tests and failure behavior.
6. Record any additional license/NOTICE obligations in workspace packages/resources.

This root remains **PARTIAL**. The direct-reuse decision is already blocked, but Phase-1 audit closure still requires the remaining authoritative evidence above.
