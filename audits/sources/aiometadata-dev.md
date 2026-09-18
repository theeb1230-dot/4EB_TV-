# Source Evidence Card: aiometadata-dev

Status: DEEP_AUDIT_COMPLETE / METADATA_ENGINE_REFERENCE / CLEAN_ROOM_ONLY / DIRECT_REUSE_BLOCKED

## Authoritative bundle evidence
- The authoritative bundle identifies this root as `aiometadata-dev` and earlier archive inspection pinned the bundled application version to **2.7.1**.
- Bundle structure contains `addon/`, `configure/`, `data/`, `docker/`, `docs/`, `public/`, `scripts/`, `package.json`, `package-lock.json`, TypeScript configs, Vite/Tailwind config, Dockerfile, `.env.example`, README, CHANGELOG and LICENSE.
- Stack is Node/TypeScript with separate backend and React/Vite configuration UI surfaces.

## Pinned public 2.7.1 corroboration
Public upstream `cedya77/aiometadata` tag **v2.7.1** is used only as corroborating evidence until decisive authoritative archive blobs are hash-matched.
- `package.json` at v2.7.1 reports version 2.7.1, Node >=24 <25 and declares **Apache-2.0**.
- Root `LICENSE` at the same tag is **GNU GPL v3**. This is a direct license-declaration conflict, so direct code reuse fails closed.
- Dependencies include Express, SQLite, PostgreSQL, Redis, axios/undici, SOCKS fetching, React/Vite, Fanart API, Kitsu, image processing and metadata/data tooling.
- `.env.example` exposes configuration names for SQLite/PostgreSQL, Redis, admin/password protection, metrics, TMDB, TVDB, Fanart, RPDB, MDBList, Gemini, SimKL, AniList and Trakt. No credential value is reproduced or inherited.
- The v2.7.1 changelog records bounded/redacted log buffering and explicitly avoids caching degraded provider fallbacks on transient upstream errors. Those are useful clean-room reliability/privacy concepts, not reusable implementation.

## 4BA classification
Classification: **Metadata Engine + Reference**.

Useful clean-room concepts:
- canonical metadata normalization and external-ID mapping;
- provider-independent metadata cache boundaries;
- bounded caches/log buffers;
- transient-upstream fallback behavior that avoids poisoning caches;
- optional storage tiers and explicit concurrency/rate-limit controls.

## Constitution conflicts / boundaries
- Metadata remains independent from Streams and from the Player.
- Redis/PostgreSQL/Docker/server deployment cannot become mandatory for 4BA core; local-first storage must work without paid infrastructure.
- TMDB/TVDB/Fanart/RPDB/MDBList/Gemini/SimKL/AniList/Trakt integrations require their own terms, authorization, cost and privacy review. Paid/credentialed integrations remain optional or excluded.
- Watch/check-in or account-linked tracking is not inherited into default local mode. 4BA progress/history stays local by default and Zero-PII.
- Metrics/telemetry are not inherited merely because they can be disabled upstream; 4BA diagnostics remain local/anonymous/optional.
- SOCKS/proxy behavior is not a Metadata Engine requirement and is not promoted into 4BA.
- No secrets, OAuth client secrets, API keys or database credentials may enter the public repository.

## Admission decision
Migration modes: **CLEAN_ROOM_BEHAVIOR + CONTRACT_REFERENCE**.
Direct implementation reuse is **blocked** by the Apache-2.0 package declaration versus GPL-3.0 root-license conflict. Public v2.7.1 evidence does not by itself prove every authoritative bundle blob, so no LICENSED_REUSE promotion is allowed.

## Evidence-bounded closure
The authoritative bundle is sufficient to establish the v2.7.1 Node/TypeScript backend + React/Vite configuration topology, package/lock/env/license presence, storage/network/provider families and the direct-reuse risk. Pinned public v2.7.1 evidence remains corroboration rather than a substitute for authoritative provenance.

The package-declared Apache-2.0 versus root GPL-3.0 conflict is independently sufficient to block direct implementation reuse. Therefore unresolved file-level attribution cannot promote any code and is handled as an exclusion rather than leaving the audit indefinitely open. Likewise, external metadata APIs are not admitted by this source review: each requires a separate 4BA terms/cost/privacy/authorization decision and credential handling outside the public repository.

No player or stream-provider capability is inferred. Redis/PostgreSQL/Docker, SOCKS/proxy behavior, account/check-in tracking, metrics and server logging are not Core requirements. 4BA may independently specify canonical metadata normalization, ID mapping, bounded local caches/logs, concurrency limits and non-poisoning transient fallback behavior.

**Phase-1 result: AUDIT COMPLETE — METADATA_ENGINE_REFERENCE + CLEAN_ROOM_BEHAVIOR only. Direct implementation reuse: BLOCKED. External API/provider admission: NOT GRANTED.**
