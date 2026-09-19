# ADR: Signed Configuration Verification and Key Rotation

Status: ACCEPTED ARCHITECTURAL CONTRACT, production algorithm selection deferred to platform compatibility evidence.

## Context
4BA permits optional remote configuration for capability admission and provider kill switches. Remote configuration is not an authority merely because it is reachable. The client must reject tampered, replayed, downgraded, expired, or unknown-key configuration without requiring a paid backend.

## Decision
1. Verification is platform/composition-owned and implements the existing `ConfigSignatureVerifier` contract. Core and Experience packages never load private keys.
2. Clients ship only public verification material or public-key fingerprints required by the selected implementation. Private signing keys never enter the application, repository, build artifacts, remote config, logs, analytics, or client storage.
3. Every signed envelope is versioned. The existing `ConfigVersionGuard` remains the replay/downgrade boundary.
4. Verification is fail-closed: malformed signatures, unknown key identifiers, unsupported algorithms, invalid payloads, and rollback outside locally verified history are rejected.
5. Rotation uses overlapping trust windows: a release may trust current and next public keys; configuration signed by the current key can announce only a pre-authorized next key identifier, never arbitrary trust material.
6. Key removal is client-release controlled after an overlap window. A remote payload cannot remove the final trusted key or grant trust to an unpinned key.
7. Emergency revocation is implemented by a client update and/or an already-trusted signed revocation statement. Network failure never disables the last locally verified safe configuration.
8. Last-known-good verified configuration is bounded and local. Rollback never accepts a configuration that failed signature/version checks.
9. Key identifiers, verification outcomes, and config versions may be recorded in local diagnostics. Raw signed payload secrets, credentials, user identifiers, and private material are prohibited.
10. No signature service, key-management SaaS, or permanently available 4BA backend is required for core operation.

## Algorithm selection
The concrete asymmetric algorithm and secure-storage APIs are intentionally not frozen in Phase 2. Selection requires compatibility evidence for provisional Android API 24, iOS 15, Web/PWA, and the chosen Dart/Flutter cryptographic implementation. The selection must support public-key verification on all targets without embedding signing secrets.

## Threats addressed
- remote configuration tampering
- replay and downgrade
- compromised or retired signing key
- network outage
- malicious configuration attempting to authorize itself
- accidental secret inclusion in client artifacts

## Non-goals
This mechanism does not bypass DRM, paywalls, authentication, geo-rights, or upstream access controls. It does not make an unreviewed provider authorized.

## Verification gates before production
- cross-platform known-answer signature tests
- invalid signature / unknown key / stale version tests
- current-to-next rotation test
- retired-key rejection test
- offline last-known-good startup test
- repository/build secret scan
- documented Android API 24, iOS 15 and Web compatibility evidence
