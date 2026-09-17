# Source Evidence Card: flixquest-main

Status: INVENTORY_EVIDENCED / DEEP_AUDIT_PENDING

## Bundle evidence
The bundle contains a Flutter-oriented `flixquest-main` tree with `lib/`, `android/`, `assets/`, `test/`, `docs/`, `tool/`, `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`, `.metadata`, `.fvmrc`, `LICENSE`, `README.md`, `openapi.json`, `cast_receiver/`, `new_ui/`, `new_designs/`, and a landing-page area. Cast receiver files include HTML/JS/CSS. UI-reference filenames show home, explore, search, sort/filter, details and related-content concepts.

## Evidence-backed interpretation
- Stack family: Flutter client with Android target.
- UX signal: dedicated design/reference assets and tests.
- Cast signal: explicit cast receiver implementation exists.
- API signal: `openapi.json` exists and must be inspected to separate client UX from backend assumptions.

## 4BA relevance
Primary candidate: Experience / Reference. It is a strong source to inspect for adaptive Flutter shell, navigation, search/details patterns, TV behavior, Cast UX, focus handling, and component organization. 4BA Cinematic Gold remains the default identity; FlixQuest concepts cannot override the locked V1 dark-first constitution.

## Security/license gate
LICENSE is present but not yet read. Backend/API assumptions and any telemetry/ads must be audited. Visual assets are not automatically reusable merely because they exist in the archive.

## Next evidence required
Read pubspec/LICENSE, app entry point, router/navigation, state management, responsive/TV focus code, player/cast integration, openapi schema, tests, ads/tracking references, minimum Android/iOS targets and asset licensing.
