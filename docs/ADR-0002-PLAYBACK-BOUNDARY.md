# ADR-0002: Provider-independent native playback

Status: Accepted as a product invariant.

## Decision
Providers resolve authorized playback candidates; the 4BA Player owns playback state. Android/TV/iOS use native playback first. Web uses in-browser playback. Internal WebView is a final fallback only where direct native playback is technically impossible and lawful.

## Session invariants
A source switch preserves canonical content ID, episode identity and last confirmed playback position. Candidate-specific headers/options remain inside the resolver/player handoff and do not leak into Experience models.

## Required candidate metadata
Protocol/container, URI, quality/bitrate when known, audio/subtitle tracks when known, expiry when known, required lawful request metadata, download eligibility, and health observations.

## Rejected
External-browser playback as the normal app path; provider-owned player screens; GitHub/4BA video proxying; DRM/paywall/access-control bypass.
