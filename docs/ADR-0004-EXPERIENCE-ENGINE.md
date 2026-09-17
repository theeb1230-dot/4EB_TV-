# ADR-0004: Experience Engine isolation

Status: Accepted as a product invariant.

## Decision
4BA Cinematic Gold is the default Experience. Other source projects become selectable Experiences only after proving distinctive UX value and maintainability. Non-UI projects remain Engine/Provider/Reference inputs.

## Persistence invariant
Switching Experience changes presentation/navigation configuration, not the user's canonical favorites, history, progress, downloads, account/local mode or settings. Preview never mutates the active Experience until Apply.

## V1 visual invariant
Dark-first only. Official 4BA uses controlled cinematic gold. Alternate Experiences may define accent/layout tokens but cannot disable accessibility, RTL, TV focus, privacy or core navigation safety.
