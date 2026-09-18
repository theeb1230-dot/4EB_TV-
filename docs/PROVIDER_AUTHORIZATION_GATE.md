# Provider Authorization Gate

This gate applies before any 4BA Provider can move from audited/reference status to enabled production status.

## Required evidence
A provider is disabled by default unless all applicable evidence is recorded:
1. **Source authority**: official/public API, explicit permission, compatible public feed, user-owned endpoint, or other documented lawful authorization.
2. **Content authority**: provider access does not itself prove rights to redistribute or proxy media.
3. **Access controls**: no DRM, paywall, authentication, rate-limit, anti-bot or technical protection bypass.
4. **Credentials**: no harvested, shared, embedded or third-party private credentials. User-supplied credentials, when legitimately supported, stay in platform-secure storage and never enter logs/config bundles.
5. **Transport**: direct authorized playback candidate preferred. 4BA does not relay/proxy media through GitHub or its own backend.
6. **Capabilities**: Search, Metadata, Stream, Download, Subtitle, Live and EPG are separately declared. Stream never implies Download.
7. **Privacy**: no hidden analytics/check-ins/tracking. Optional sync is an explicit separate capability.
8. **Cost**: no mandatory paid backend/API for core product operation.
9. **Failure isolation**: provider can be disabled/removed without breaking Core or Experiences.
10. **Provenance/license**: adapter code and copied assets have a documented compatible reuse decision.

## Admission states
- **REFERENCE_ONLY**: concepts may inform clean-room design; provider cannot execute.
- **QUARANTINED**: security/credential/access-control risk; no implementation reuse.
- **PENDING_AUTHORIZATION**: technical adapter may be understood, but source authority is not proven.
- **PENDING_LICENSE**: source authority may be acceptable but implementation reuse rights are unresolved.
- **ELIGIBLE_DISABLED**: evidence passes, but provider remains disabled until product/config approval.
- **ENABLED**: explicit reviewed config enables the provider.
- **REVOKED**: previously eligible/enabled provider disabled due authorization, security, reliability or policy change.

## Kill-switch behavior
Provider enablement must fail closed. Unknown providers, missing signatures/config integrity, revoked providers or stale unsafe configuration resolve to disabled. A kill switch removes provider availability without deleting user favorites/history/progress because user state references canonical content, not provider IDs.

Signed remote configuration is **not yet implemented**. 4BA will not invent custom cryptography; signature primitives and key lifecycle require a dedicated platform/dependency security audit.

## Current audited-source rule
Every provider-oriented source in the 30-project bundle remains REFERENCE_ONLY, QUARANTINED or PENDING_AUTHORIZATION unless a later evidence record explicitly promotes it. Repository presence, Stremio compatibility, public URLs, scraper code or a permissive package license are not authorization.
