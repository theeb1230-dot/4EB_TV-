# Source Evidence Card: ProxyFill-main

Status: DEEP_AUDIT_COMPLETE / EXCLUDED_RUNTIME

## Authoritative bundle evidence
- .NET/Blazor Pokémon proxy-printing tool in the authoritative 30-root corpus.
- Domain is unrelated to 4BA entertainment discovery/playback.
- Its presence is retained in the audit so the 30/30 corpus remains accountable rather than quietly deleting inconvenient roots.
- The authoritative bundle was re-read directly in this run. Six decisive source blobs match the pinned public repository exactly at Git blob SHA-1 level: README `8db2ae50fa0308455fbf1126e471f6b072feafdc`, `ProxyFill.csproj` `3d4864de0ee52f0b97fd9373106d612ad2c206a7`, `Program.cs` `e76ca2b4713496d7c3a5bf3ba79bd3561c070623`, `ProxyFill.Shared/ProxyFill.Shared.csproj` `31ad390b811dc7cbcae875906460d0cd06363108`, `ProxyFill.Shared/Services/PokemonAPIService.cs` `a01d8cf9796a509af42e7d2e6360f4c1834b1eda`, and `global.json` `7cd6a1f4fda5a3e815a474375a11cff880082cbf`. This closes snapshot identity for the files material to the exclusion decision.

## Corroborating public repository evidence
A public repository with the matching project identity is available at `hfip/ProxyFill`. Evidence was pinned to public `main` commit `1a49d164d10aa24ae5ef57b6a275758500310bae` rather than an unversioned page view. Inspected blobs include README `8db2ae50fa0308455fbf1126e471f6b072feafdc`, `ProxyFill.csproj` `3d4864de0ee52f0b97fd9373106d612ad2c206a7`, `Program.cs` `e76ca2b4713496d7c3a5bf3ba79bd3561c070623`, shared project manifest `31ad390b811dc7cbcae875906460d0cd06363108`, and the Pokémon API service blob `a01d8cf9796a509af42e7d2e6360f4c1834b1eda`. This remains corroborating evidence until bundle-local blob matching closes provenance.

Its pinned `main` confirms:
- root project uses `Microsoft.NET.Sdk.BlazorWebAssembly` targeting `net6.0`; `global.json` requests .NET SDK 7 with roll-forward.
- declared packages include AutoMapper 12.0.1, Microsoft.AspNetCore.Components.WebAssembly 6.0.7, MudBlazor 6.0.13, Selenium.WebDriver 4.10.0 and Syncfusion.Pdf.Net.Core 22.1.37; the project also references a bundled Pokémon TCG SDK DLL. These versions are evidence for the corroborating repository only until authoritative-bundle matching is completed.
- README describes the product as a web app for automating printing Pokémon proxy cards using DriveThruCards and mentions a desktop companion.
- `Program.cs` registers a base-address HttpClient and a Pokémon API service. No entertainment catalog, metadata, playback, live-TV, subtitle, download or Provider-SDK behavior is evidenced.
- The authoritative `ProxyFill.csproj` is byte-identical to the pinned public blob and explicitly marks `wwwroot/credentials.json` with `CopyToOutputDirectory=Always`. The archive itself does not contain that credentials file path, so no credential file contents were read or copied. The build directive is still an unsafe secret-handling design and reinforces exclusion.
- The authoritative `ProxyFill.Shared/Services/PokemonAPIService.cs` blob exactly matches the pinned public blob that contains a hard-coded API credential/token. **The value is intentionally not copied into 4BA documentation, commits or logs.** This proves the secret-handling defect exists in the archived snapshot itself.
- The authoritative ProxyFill root contains 90 non-`__MACOSX` entries and no LICENSE/NOTICE-named file. Therefore no direct code/assets reuse is authorized. For an unrelated source that is being excluded rather than copied, this absence is itself the explicit fail-closed license decision.
- `launchSettings.json` contains development localhost/browser-launch settings only in the inspected file; no 4BA-relevant runtime contract is derived from it.

## 4BA relevance
Classification: **Unrelated + Reference**.
No product capability, Experience, Provider, Metadata, Player or Backend destination is required.

## Security / constitution impact
- Hard-coded credential handling and copying a credentials JSON file into client output are incompatible with 4BA security/Zero-PII rules and are never migrated.
- Selenium/browser automation, Pokémon-specific datasets/assets, printing/PDF workflows and bundled third-party binaries are unrelated to the 4BA product runtime.
- Any donation link or external service referenced by the source cannot become a mandatory 4BA dependency.
- No evidence justifies playback, provider, metadata, live, EPG or download capability extraction.

## Admission boundary
Runtime migration is **EXCLUDED**. Do not import Pokémon/domain assets, printing workflows, unrelated data models, credentials, browser automation or dependencies merely to claim reuse.

## Migration decision
Migration mode: **EXCLUDED**. Phase-1 closure for this root requires enough authoritative snapshot provenance/license confirmation to prove that the archived root corresponds to the inspected project family and that no contradictory 4BA-relevant behavior exists. It does not require exhaustive auditing of unrelated card-printing features.

## Phase-1 closure evidence
- Provenance/snapshot identity: closed by exact six-blob match against pinned public commit.
- Technology/architecture: Blazor WebAssembly/.NET plus shared netstandard project; exact manifests matched.
- License/reuse: no bundle-local LICENSE/NOTICE detected; direct reuse fails closed; runtime/source migration is EXCLUDED.
- Dependencies: exact project manifest matched; relevant dependency set recorded.
- Network/API: Pokémon API/Drive-oriented HttpClient behavior is evidenced and unrelated to 4BA.
- Secrets/privacy: hard-coded API credential proven in authoritative matched blob; credential value never reproduced. Unsafe credentials-output directive proven in authoritative manifest; credentials file itself absent from archive.
- Ads/tracking: bounded scan of text/code files in this authoritative root found no matches for the selected analytics/telemetry/ad SDK signatures. This is evidence for exclusion, not a general security warranty.
- Player/provider: not applicable; no entertainment playback/provider capability evidenced.
- Migration/risk: EXCLUDED runtime, no 4BA destination, no implementation/assets/dependencies imported.

This root now satisfies Phase-1 audit requirements as an **evidence-backed exclusion**. No runtime/player/provider integration work is required unless contradictory authoritative evidence later appears.
