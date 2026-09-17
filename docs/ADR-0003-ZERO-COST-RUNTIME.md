# ADR-0003: Zero-cost runtime

Status: Accepted as a product invariant.

## Decision
Basic 4BA functionality cannot depend on infrastructure that requires payment, a credit card, auto-billing, or a permanently running 4BA server.

## Allowed
Client-side/local processing, static hosting within platform terms, optional free serverless assistance when not a single point of failure, authorized third-party APIs with suitable free access, and user-controlled local storage.

## Rejected
Mandatory paid databases/auth/CDNs, self-hosted video proxying, always-on scraping infrastructure required for app startup, and architectures whose free tier silently becomes a billing requirement.

## Scale implication
100 initial concurrent Web users and growth to 1000+ must primarily increase upstream/static traffic rather than 4BA compute/video bandwidth.
