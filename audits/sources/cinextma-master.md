# Source Evidence Card: cinextma-master

Status: DEEP_AUDIT_PARTIAL / EXPERIENCE_REFERENCE

## Authoritative bundle evidence
- Next.js/TypeScript web application with roughly 270 files.
- Supabase/cloud integration signals are present in the audited inventory.
- Primary value is responsive Web discovery/presentation reference.

## 4BA relevance
Classification: **Experience + Reference**.
Candidate clean-room concepts: responsive Web navigation, discovery/detail composition and browser-friendly information architecture.

## Constitution boundaries
- Supabase or any hosted backend cannot become mandatory for core 4BA operation. Web must retain local-first/static-hostable behavior where possible.
- Authentication/account state is optional; anonymous/local mode remains default.
- Browser playback must remain in-app/browser-native; no external-browser escape from native clients.
- No video proxy/relay through GitHub or 4BA backend.
- Cloud analytics/tracking, if present, are not inherited.
- License, dependencies, environment-variable handling and API terms remain unresolved at file level.

## Migration decision
Migration mode: **EXPERIENCE_REFERENCE**. Cloud-specific implementation is not foundational; useful UX is independently implemented against 4BA canonical contracts.

## Remaining evidence
Verify package manifest/lockfile, root license, Next config/routes, Supabase client/auth/database usage, environment loading, API routes/server actions, player/media handling, analytics, tests and asset provenance.
