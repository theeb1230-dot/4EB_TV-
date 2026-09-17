# 4BA License & Security Audit

Status: Phase 1. Presence of a LICENSE file is **not** equivalent to reuse approval. Public-upstream findings below are comparison evidence until the authoritative bundled revision is provenance-matched.

| Source | License evidence | Secret/config signal | Constitution/security signal | Reuse status |
|---|---|---|---|---|
| Aniyomi | Candidate upstream root LICENSE: Apache-2.0 | Current app build contains commented ACRA URI/login/password configuration hooks | No credential values copied; telemetry/crash endpoints cannot be inherited by default | BLOCKED for direct reuse until bundled revision + dependency/notices audit |
| AIOStreams | Candidate upstream: AGPL-3.0-only | Environment/configuration and SECRET_KEY model | Current manifest describes proxy/IP-restriction-bypass behavior, excluded from 4BA | CLEAN-ROOM CONCEPTS ONLY |
| FlixQuest | Bundle proves LICENSE exists; upstream LICENSE unread in this run | API schema/config artifacts observed | Player/network/ads/tracking still pending | BLOCKED |
| AIOMetadata | Candidate upstream root LICENSE text: GPL-3.0; package.json declares Apache-2.0 | .env/config and multiple external metadata/cache dependencies | License metadata conflict is a release/reuse blocker | CLEAN-ROOM CONCEPTS ONLY pending resolution |

## Mandatory handling
Never reproduce credential/token/cookie/private-key values in commits, issues, PRs or audit reports. Unknown/no-license code is not copied. Advertising SDKs, ad tracking, popups and pre-roll are rejected. Paid dependencies cannot become mandatory. DRM/paywall/access-control bypass is excluded. Source assets require their own licensing evidence where applicable.

## Current blockers
1. Match each bundled snapshot to an upstream commit/tag before relying on upstream license/version details.
2. Resolve AIOMetadata's upstream GPL-3.0 LICENSE versus Apache-2.0 package declaration before any direct reuse.
3. Treat AIOStreams as clean-room/reference-only unless a future legal/license decision explicitly approves AGPL obligations.
4. Read FlixQuest license/pubspec/player/network files from the authoritative snapshot before reuse.
