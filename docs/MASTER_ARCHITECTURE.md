# 4BA Master Architecture

Status: PHASE 2 ARCHITECTURE BASELINE. Phase 1 deep audit is accepted; runtime provider admission remains independently fail-closed.

## Architectural invariant
4BA is a local-first adaptive client. The core product must remain usable without a paid or permanently available 4BA backend. Video traffic is never proxied through GitHub or a 4BA-owned general backend.

## Layers
1. **Core** — domain identities, storage contracts, configuration, security, localization, accessibility and diagnostics.
2. **Capability Kernel** — typed capabilities and lifecycle boundaries. It knows contracts, not provider brands.
3. **Experience Engine** — presentation/navigation/layout only. Experiences consume Core capabilities and never call providers directly.
4. **Provider SDK** — replaceable adapters declaring metadata, catalog, search, stream, download, subtitle, live and EPG capabilities independently.
5. **Metadata Engine** — canonical identity, external-ID mapping, normalization, artwork and deduplication. It does not own stream resolution.
6. **Universal Resolver** — candidate aggregation, health/ranking, retry/fallback and manual Advanced Sources.
7. **Player** — playback session/state independent of provider. Native HLS/DASH/MP4 first; internal WebView is last fallback.
8. **Local Data** — favorites, history, progress, downloads, settings, caches, recommendation signals and diagnostics. Default mode is local.
9. **Optional Gateway** — only for technically necessary lawful integrations; never mandatory for basic product use, never a paid architectural dependency, never a video proxy.

## Dependency rule
Experience -> Capability Kernel -> Core contracts.
Provider adapters implement Provider SDK contracts.
Resolver consumes Provider SDK and Metadata identities.
Player consumes resolved media candidates, never provider-specific UI objects.
No reverse dependency from Core to an Experience or concrete Provider.

## Platform shells
Flutter is the intended shared client shell subject to compatibility audit. Android Mobile, Android TV, iOS and Web/PWA share domain/contracts while platform integration remains explicit. TV is a dedicated 10-foot presentation mode, not a scaled phone layout.

## Scale model
Static assets/configuration may use zero-cost static hosting. Catalog/metadata work should be cacheable and client-distributed where lawful. At 100–1000+ concurrent Web users, 4BA infrastructure must not carry video bandwidth; clients talk to authorized upstream media endpoints directly.

## Security/privacy
No credentials in public source or signed config. Remote config must be signed, versioned, rollback-capable and support provider kill switches. Telemetry is local/anonymous/optional and Zero-PII. Ads and ad tracking are prohibited.

## Workspace boundaries
- `core_domain` owns provider-independent identities, capability/playback/failure contracts and may not import UI or concrete providers.
- `provider_sdk` depends only on Core contracts and owns provider lifecycle/admission interfaces.
- `metadata_engine` depends on Core identities and owns canonicalization/deduplication, never playback resolution.
- `resolver_engine` consumes Core + Provider SDK and owns health/ranking/fallback, never presentation.
- `design_tokens` is platform-neutral and owns executable semantic visual/layout/focus/motion tokens. It must not import provider or network code.
- Future Experience/UI packages may depend on Core + design tokens and capability facades, never concrete providers.
- Future platform shells compose packages at the edge; platform plugins do not leak into Core contracts.

## Phase 2 acceptance gates
- Package dependency graph follows the boundaries above and CI tests every executable package.
- Architecture documents and ADRs agree with actual imports and package manifests.
- No paid/mandatory backend, provider-specific UI dependency, ad/telemetry SDK, or credential enters foundational packages.
- Platform-specific player/persistence/network selections remain deferred until compatibility evidence is recorded for provisional Android API 24 / iOS 15 baselines.
- Web playback/CORS feasibility remains an integration admission concern, not a reason to proxy video through 4BA infrastructure.
