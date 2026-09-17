# ADR-0001: Capability-first boundaries

Status: Accepted as a product invariant.

## Decision
4BA owns capability contracts and canonical domain models. Experiences and providers are plugins around those contracts, not peers that share arbitrary implementation objects.

## Why
The 30-source corpus contains clients, backends, addons, data repositories and unrelated tools. Treating all of them as interchangeable UIs would couple navigation to source behavior and make provider failure a UI failure.

## Consequences
- UI cannot import a concrete provider.
- Provider names are hidden in normal UX.
- Watch and Download are separate declared capabilities.
- Metadata and Streams are separate capabilities.
- Resolver may rank/fallback across candidates without changing the Experience.
- A provider can be disabled by signed configuration without rebuilding the app.
- A selectable Experience must function against capability contracts rather than its original backend.
