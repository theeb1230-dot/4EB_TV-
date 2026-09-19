# Source Evidence Card: orien.live-main

Status: DEEP_AUDIT_COMPLETE / QUARANTINED / RUNTIME_EXCLUDED

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

## Evidence-bounded closure
The authoritative classification is itself decisive security evidence: this source centers on credential-discovery/finder behavior, which is constitution-incompatible for 4BA. Completing the audit does not require executing that behavior, discovering a credential, contacting a target, or reproducing sensitive values. License or dependency uncertainty cannot make the prohibited runtime admissible.

The source is therefore closed by quarantine. No implementation, data, endpoint, account material, playlist, token, cookie, credential, network target or authentication workflow is migrated. The only retained artifact is the negative provider-admission rule that harvested/shared/private credentials and access-control bypass fail closed.

**Phase-1 result: AUDIT COMPLETE — QUARANTINED / RUNTIME_EXCLUDED. Direct/runtime reuse: BLOCKED.**
