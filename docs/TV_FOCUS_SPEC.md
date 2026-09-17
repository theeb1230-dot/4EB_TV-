# 4BA TV Focus Specification

Status: V1 interaction contract.

## Core rules
- Every interactive TV element is focusable or intentionally excluded.
- Exactly one primary focus target exists after each route transition.
- Back restores the previous logical focus when the originating item still exists.
- D-pad movement is deterministic; no invisible focus traps.
- Horizontal content rows preserve row position independently.
- Opening details/player never resets the entire Home position.

## Focus presentation
Focus must remain legible at 2–4 meters. Use semantic focus tokens and at least two visible cues. Scaling must not clip neighboring content or alter scroll geometry unpredictably.

## Remote behavior
Short press activates the focused action. Long-press may expose contextual actions only when discoverable and safe. Channel Up/Down is reserved for live playback when supported. Back closes overlays before leaving playback.

## Player
Initial focus favors Play/Pause when controls are opened. Seek/audio/subtitles/quality/source controls are reachable without pointer input. Auto-next Cancel is reachable immediately. Error recovery has a deterministic Retry/Next Source path.

## Testing
Required tests later: route-entry focus, row edge navigation, nested carousels, dialog/sheet trapping, Back restoration, RTL directional behavior, player controls, long-press, screen-reader coexistence and 10-foot legibility.
