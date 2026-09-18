# Source Evidence Card: ProxyFill-main

Status: DEEP_AUDIT_PARTIAL / EXCLUDED_RUNTIME

## Authoritative bundle evidence
- .NET/Blazor Pokémon proxy-printing tool in the authoritative 30-root corpus.
- Domain is unrelated to 4BA entertainment discovery/playback.
- Its presence is retained in the audit so the 30/30 corpus remains accountable rather than quietly deleting inconvenient roots.
- Exact bundle-to-public-repository blob matching is still pending; public repository evidence below is corroborating, not a substitute for the archived snapshot.

## Corroborating public repository evidence
A public repository with the matching project identity is available at `hfip/ProxyFill`. Its current `main` confirms:
- root project uses `Microsoft.NET.Sdk.BlazorWebAssembly` targeting `net6.0`; `global.json` requests .NET SDK 7 with roll-forward.
- declared packages include AutoMapper, Blazor WebAssembly, MudBlazor, Selenium WebDriver and Syncfusion PDF; the project also references a bundled Pokémon TCG SDK DLL.
- README describes the product as a web app for automating printing Pokémon proxy cards using DriveThruCards and mentions a desktop companion.
- `Program.cs` registers a local/base-address HttpClient and a Pokémon API service. No entertainment catalog, metadata, playback, live-TV, subtitle, download or Provider-SDK behavior is evidenced.
- `ProxyFill.Shared/Services/PokemonAPIService.cs` contains a hard-coded API credential/token value. **The value is intentionally not copied into 4BA documentation, commits or logs.** This is a concrete secret-handling violation and reinforces exclusion.
- root listing inspected from the public repository did not expose a root LICENSE file. That observation does not prove the authoritative bundle has no license; bundle-local license evidence remains pending.
- `launchSettings.json` contains development localhost/browser-launch settings only in the inspected file; no 4BA-relevant runtime contract is derived from it.

## 4BA relevance
Classification: **Unrelated + Reference**.
No product capability, Experience, Provider, Metadata, Player or Backend destination is required.

## Security / constitution impact
- Hard-coded credential handling is incompatible with 4BA Zero-PII/security rules and is never migrated.
- Selenium/browser automation, Pokémon-specific datasets/assets, printing/PDF workflows and bundled third-party binaries are unrelated to the 4BA product runtime.
- Any donation link or external service referenced by the source cannot become a mandatory 4BA dependency.
- No evidence justifies playback, provider, metadata, live, EPG or download capability extraction.

## Admission boundary
Runtime migration is **EXCLUDED**. Do not import Pokémon/domain assets, printing workflows, unrelated data models, credentials, browser automation or dependencies merely to claim reuse.

## Migration decision
Migration mode: **EXCLUDED**. Phase-1 closure for this root requires enough authoritative snapshot provenance/license confirmation to prove that the archived root corresponds to the inspected project family and that no contradictory 4BA-relevant behavior exists. It does not require exhaustive auditing of unrelated card-printing features.

## Remaining evidence
1. Match authoritative bundle project/solution/README blob hashes or equivalent snapshot markers against the corroborating repository.
2. Verify bundle-local root license/provenance.
3. Confirm bundle-local project manifest dependency set and absence/presence of additional network/telemetry behavior relevant to exclusion.
4. Record whether the embedded credential is also present in the authoritative bundle **without ever recording its value**.

No runtime/player/provider integration work is required unless contradictory authoritative implementation evidence appears.
