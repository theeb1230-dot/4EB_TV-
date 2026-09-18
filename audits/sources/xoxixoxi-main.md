# Source Evidence Card: xoxixoxi-main

Status: DEEP_AUDIT_PARTIAL / REFERENCE_ONLY

## Authoritative bundle evidence
- Large Node-oriented corpus: roughly 6,711 files.
- Puppeteer/headless-browser and ffmpeg dependency signals are present.
- Architecture is backend/extraction-oriented rather than a client Experience.

## 4BA relevance
Classification: **Provider + Engine + Reference**.
Only generic clean-room concepts are candidates: bounded worker/process lifecycle, staged resolver failures, timeout classification and isolation of expensive extraction work.

## Constitution boundaries
- Puppeteer/headless-browser/ffmpeg infrastructure cannot become a mandatory core dependency under ZERO_COST.
- No scraping/extraction behavior is admitted without explicit source authorization and terms review.
- DRM/paywall/access-control/anti-bot bypass behavior is excluded.
- No backend video relay/proxy.
- Process execution must never receive untrusted shell fragments or secret values from UI/provider responses.

## Migration decision
Migration mode: **CONTRACT_REFERENCE** only. Runtime/provider implementation remains blocked pending license, authorization, network and process-security evidence.

## Remaining evidence
Verify package manifests/lockfile, root license, process spawning/ffmpeg invocation, Puppeteer lifecycle, network targets, resource limits, tests, secrets/config, ads/tracking and whether any extraction path depends on bypass behavior.
