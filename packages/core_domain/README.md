# core_domain

4BA-owned, provider-independent domain contracts.

Rules:
- No Flutter dependency.
- No networking/storage/provider implementation dependency.
- No secrets or provider endpoints.
- Metadata identity and playback candidates remain separate.
- Watch/stream capability never implies download capability.
- Provider identifiers are diagnostic internals, not normal Experience UI.
