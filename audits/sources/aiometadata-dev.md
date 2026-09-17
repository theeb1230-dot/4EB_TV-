# Source Evidence Card: aiometadata-dev

Status: INVENTORY_EVIDENCED / DEEP_AUDIT_PENDING

## Bundle evidence
The bundle contains `aiometadata-dev` with `addon/`, `configure/`, `data/`, `docker/`, `docs/`, `public/`, `scripts/`, `package.json`, `package-lock.json`, multiple TypeScript configs including backend/node/app variants, `vite.config.mts`, `tailwind.config.mts`, `Dockerfile`, `.env.example`, `README.md`, `CHANGELOG.md`, and `LICENSE`.

## Evidence-backed interpretation
- Stack family: TypeScript with separate app/backend build concerns and Vite-based web/configuration surface.
- Architecture signal: addon/configure/data boundaries make it a key Metadata Engine reference.
- Deployment signal: Docker support exists but is not a requirement 4BA will inherit.
- Configuration signal: environment example exists; secrets and external-service requirements must be audited.

## 4BA relevance
Primary candidate: Metadata Engine / Reference. Inspect metadata normalization, identifier mapping, deduplication, artwork/provider separation, cache strategy, schemas and failure behavior. 4BA must keep metadata independent from stream providers.

## Security/license gate
LICENSE exists but terms are pending extraction. Environment/config values are not copied. Any paid-service dependency must remain optional or be replaced to preserve ZERO_COST.

## Next evidence required
Read LICENSE/package manifests, addon entry points, metadata schemas/mappers, provider integrations, cache/storage, API-key handling, tests, telemetry, rate-limit behavior and fallback strategy.
