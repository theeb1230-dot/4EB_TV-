# resolver_engine

4BA-owned deterministic candidate ranking.

Current inputs are intentionally Zero-PII: anonymous candidate ID, success/failure, latency and optional bitrate. No title, account, search text or user identifier is needed.

This first implementation is local-only and provider-independent. It does not perform network requests, scraping or playback. Ranking weights are explicit and testable; future freshness/quality policies must remain deterministic and covered by tests.
