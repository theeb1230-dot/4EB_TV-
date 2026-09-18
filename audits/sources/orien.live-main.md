# Source Evidence Card: orien.live-main

Status: DEEP_AUDIT_PARTIAL / QUARANTINED

## Authoritative bundle evidence
The authoritative corpus classifies this source around credential-discovery/finder behavior. That is sufficient to treat it as a security-risk reference, not a production provider candidate.

## 4BA relevance
Classification: **QUARANTINED Reference only**.
Its only useful contribution is negative security evidence: provider admission must reject harvested/shared/private credentials and fail closed when legitimate authorization is absent.

## Non-negotiable exclusions
- No credential harvesting, discovery, guessing, replay or sharing.
- No copied usernames/passwords/tokens/cookies/private playlists.
- No authentication/access-control bypass.
- No production network calls derived from discovered credentials.
- No secret values may appear in audit documentation, fixtures, logs or commits.

## Migration decision
Migration mode: **QUARANTINE**. No runtime code/provider/data migration. Audit completion can be satisfied by documenting risk and exclusion; it does not require executing credential-oriented behavior.

## Remaining evidence
Only safe provenance/license/dependency/security classification is required. Do not run credential-finding paths or record discovered values.
