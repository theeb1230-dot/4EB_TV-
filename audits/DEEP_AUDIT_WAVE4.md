# Deep Audit Wave 4 — Remaining UI, Addon and Provider Candidates

Baseline main: `74c6df21e4dea35e38304bfc99f4edcf1a8c6002`.
Evidence source: authoritative 30-project bundle plus existing inventory cards. This wave closes classification coverage; it does not grant production-provider authorization.

## Experience / UI candidates
### cinemalist-official-master
- Flutter/TMDB/BLoC signal; ~250 bundled files.
- Classification: **Experience + Reference**.
- Candidate value: discovery/catalog presentation and Flutter state-management patterns.
- Gate: exact license, API-key handling, network and tracking scan required before direct reuse.

### cinextma-master
- Next.js/TypeScript; ~270 files; Supabase signal.
- Classification: **Experience + Reference**.
- Candidate value: responsive web discovery UX.
- 4BA constraint: Supabase/cloud account state cannot become mandatory; Web/PWA core remains static/local-first and ZERO_COST.

### Filmex-main
- Flutter; ~61 files.
- Classification: **Experience + Reference**.
- Candidate value: compact Flutter content UI patterns.
- Gate: license/dependencies/player/network evidence pending.

### CinemaPress-master
- Node/EJS/Express CMS.
- Classification: **Reference + Engine**.
- Candidate value: catalog/admin/content-organization concepts only.
- 4BA constraint: no mandatory CMS/backend for client basics.

## Provider / addon candidates
### ARB-S33-3-main
- Node/Stremio ArabSeed addon signal.
- Classification: **Provider + Reference**.
- Gate: source authorization, license, network behavior and content rights required before any adapter.

### alooytv-addon-main
- Node/Stremio addon.
- Classification: **Provider + Reference**.
- Gate: same provider admission requirements; addon compatibility does not imply source authorization.

### NuvioStreamsAddon-master
- Node streaming addon.
- Classification: **Provider + Engine + Reference**.
- Candidate value: addon/provider boundary concepts.
- Gate: endpoint authorization and license review.

### TRK_S-main
- Turkish Stremio addon/provider.
- Classification: **Provider + Reference**.
- Candidate destination: Turkish provider adapter only if source access is authorized.

### stremio-akwam.X-main
- Python/FastAPI Stremio-style Akwam project.
- Classification: **Provider + Engine + Reference**.
- Candidate value: protocol/adapter concepts.
- Gate: no unauthorized scraping, access-control bypass or mandatory backend.

### kiro-drama-main / kiro-main
- Small JS/JSON provider/source projects.
- Classification: **Provider + Reference**.
- Candidate value: simple normalized source data concepts.
- Gate: authorization/license/freshness.

## Reference/tool candidate
### ProxyFill-main
- .NET/Blazor Pokémon proxy-printing utility, unrelated to media playback/catalog architecture.
- Classification: **Reference/Unrelated**.
- Decision: no runtime/UI/provider integration. Keep only as audited evidence that not every bundled project should be forced into 4BA.

## Phase-1 classification coverage
All 30 bundled roots now have at least an evidence-backed architectural classification across the source cards and Deep Audit waves 1–4. This satisfies **classification coverage only**.

It does NOT satisfy the full Phase-1 acceptance gate because several projects still lack file-level:
- license verification,
- dependency inventory,
- network/API contract review,
- secrets/credentials scan,
- advertising/tracking scan,
- provider authorization determination,
- player behavior/security review,
- provenance/version match.

No project advances to production provider status merely because classification coverage is complete.
