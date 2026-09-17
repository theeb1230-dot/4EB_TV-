# 4BA License & Security Audit

Status: Phase 1. Presence of a LICENSE file is **not** equivalent to reuse approval.

| Source | LICENSE observed | Secret/config signal | Ads/tracking | Reuse status |
|---|---:|---|---|---|
| Aniyomi | Yes | Pending inspection | Pending inspection | BLOCKED until terms/code audit |
| AIOStreams | Yes | `.env.sample` observed | Pending inspection | BLOCKED until terms/code audit |
| FlixQuest | Yes | API schema/config files observed | Pending inspection | BLOCKED until terms/assets audit |
| AIOMetadata | Yes | `.env.example` observed | Pending inspection | BLOCKED until terms/dependency audit |

## Mandatory handling
Never reproduce credential/token/cookie/private-key values in commits, issues, PRs or audit reports. Unknown/no-license code is not copied. Advertising SDKs, ad tracking, popups and pre-roll are rejected. Paid dependencies cannot become mandatory. DRM/paywall/access-control bypass is excluded. Source assets require their own licensing evidence where applicable.
