# Source Evidence Card: cinextma-master

Status: DEEP_AUDIT_COMPLETE / EXPERIENCE_REFERENCE / CLEAN_ROOM_ONLY / DIRECT_REUSE_DEFERRED

## Authoritative bundle evidence
- Authoritative bundle inventory identifies a Next.js/TypeScript web application with roughly 270 files and Supabase/cloud integration signals.
- Direct selective ZIP reads for this root timed out again in the current execution environment. This is classified as an archive-read infrastructure failure, **not** as evidence about the source.
- Therefore no authoritative bundle blob/license claim is promoted in this update.

## Corroborating public repository
Matching public project: `wisnuwirayuda15/cinextma`, branch `master`.
- Public master inspected at commit `0d939f089b5225d49da0edd684346530c5b9431d`. It is corroborating only until decisive authoritative bundle blobs match.
- Public root contains `LICENSE`, `package.json`, `package-lock.json`, `.env.example`, `.env.local.example`, `next.config.ts`, `src/`, `supabase/` and PWA assets.
- Public root LICENSE is MIT. **This does not yet prove the archived snapshot license.**
- Public package is `cinextma` version `1.0.0`, private, ESM, using Next.js/React/TypeScript.
- Public manifest includes Next.js, React, Tailwind/HeroUI, TanStack Query, Supabase SSR/client, env validation, TMDB client, PWA, Turnstile, Vercel Analytics and Vercel Speed Insights.
- Public lockfile exists, so the corroborating repository has reproducible dependency evidence at that snapshot.

## Architecture / UX relevance
Classification: **Experience + Reference**.
Candidate clean-room concepts:
- responsive Web discovery/navigation/detail composition,
- PWA installability and front-end caching concepts,
- query/cache separation,
- account-aware UX as an optional layer,
- responsive information architecture.

4BA must reimplement these concepts against canonical Core/Metadata/Provider contracts and 4BA Cinematic Gold. Source branding/assets are not inherited.

## Cloud / account / environment boundaries
- Public repository uses Supabase for authentication/database flows and includes local Supabase development scripts.
- Example environment files require Google auth/SMTP and other service configuration. Placeholder values were inspected; no private credential value is copied into 4BA.
- Supabase/account/cloud cannot become mandatory for 4BA Core. Local anonymous mode remains the default and cross-device sync remains optional.
- Turnstile or any hosted anti-bot/account dependency is not a prerequisite for local browsing/playback.
- Production TMDB use remains separately terms/authorization/attribution/key-management gated and belongs to Metadata, never Streams.

## Privacy / analytics / ZERO_ADS
- Public manifest explicitly includes `@vercel/analytics` and `@vercel/speed-insights`. These are **not inherited** under 4BA Zero-PII; diagnostics remain local/anonymous/optional.
- No advertising package is identified in the inspected public package manifest, but authoritative bundle ad/tracking closure remains pending until the archived snapshot is matched/scanned.
- ZERO_ADS remains absolute regardless of upstream behavior.

## Player / provider boundary
- Public history and tree show player-oriented work and streaming branding, but public compatibility/playability is not authorization.
- No player/provider implementation is promoted from this corroborating evidence.
- 4BA Native Playback First remains authoritative: HLS/DASH/MP4 through the native player; internal WebView only final fallback; no external-browser playback; no 4BA/GitHub video relay.
- Any embed/provider/source found later must pass independent authorization and capability gates. Watch and Download remain separate.

## PWA / performance observations
- Public `next.config.ts` enables PWA registration, online reload, front-end navigation caching and aggressive front-end navigation caching.
- These are useful performance references, but 4BA Web caching must be bounded, rollback-safe and avoid caching sensitive account/provider state.
- The current public master is newer than the archived bundle may be; its dependency versions or security fixes cannot be attributed to the archive until blob/provenance matching closes.

## Migration decision
Migration mode remains **EXPERIENCE_REFERENCE**.
- No source code/assets/cloud config/player/provider implementation is admitted from cinextma at this stage.
- Mandatory Supabase/cloud/account coupling, Vercel analytics/telemetry and any unverified streaming-provider behavior are excluded from Core.
- Useful UX/PWA behavior is independently specified and implemented behind 4BA contracts.

## Closure decision
The Phase-1 audit is complete by a fail-closed migration decision. Authoritative inventory establishes the Next.js/TypeScript/Supabase shape, while repeated selective archive-read infrastructure failures prevent safely attributing the public MIT license or exact public implementation to the authoritative snapshot. Therefore direct source/assets/config reuse is deferred rather than guessed.

Public evidence remains useful only to bound clean-room behavior and risks: responsive discovery/PWA/query-cache concepts may be independently specified; mandatory Supabase/account/cloud, Vercel analytics/speed telemetry, hosted anti-bot requirements and unverified streaming/provider behavior are excluded. TMDB remains Metadata-only and independently terms/key/attribution gated. No player/provider authorization is inferred.

If authoritative blobs become readable later, they may upgrade the reuse decision, but they are not required to keep Phase 1 blocked indefinitely when the safe current answer is **do not copy**.