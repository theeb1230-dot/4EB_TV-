# 4BA Cinematic Gold Design System

Status: V1 DESIGN CONTRACT. Visual pixels/assets remain refinable; semantics and accessibility rules are binding.

## Identity
Official Experience: **4BA Cinematic Gold**.
Mood: premium cinematic, restrained, content-first.
V1 is dark-first only. Gold is an identity/accent resource, not wallpaper.
Key visual: geometric 4BA mark + wolf/moon/mountain motif. The key visual belongs to splash/brand moments, not every content surface.
Alternate Experiences may override accent/layout tokens but not accessibility, focus, RTL, player safety or core state.

## Color tokens
Semantic tokens, not hard-coded widget colors:
- surface.canvas: near-black
- surface.base: dark charcoal
- surface.raised: elevated charcoal
- surface.overlay: translucent cinematic black
- text.primary: high-contrast warm white
- text.secondary: muted neutral
- brand.gold: champagne/gold
- brand.goldStrong: selected/focus/play emphasis
- state.live/state.error: red family
- state.success/state.healthy: green family
- focus.ring: gold with guaranteed contrast
Exact production values require contrast validation on real displays before pixel freeze.

## Typography
Arabic is the default locale and RTL is first-class. English and Turkish use the same semantic scale.
Roles: display, heroTitle, titleLarge, title, body, bodyCompact, label, caption, playerTime.
Rules: never encode meaning by font weight/color alone; allow system text scaling; avoid fixed-height text containers; Arabic glyph metrics are tested separately.

## Spacing
Use an 4pt base rhythm with semantic steps: 4, 8, 12, 16, 24, 32, 48, 64. TV spacing may scale by form-factor tokens, never by blindly scaling the phone canvas.

## Radius
Semantic roles: small controls, cards, sheets/dialogs, pills. Poster artwork must remain visually dominant; excessive rounded containers are prohibited.

## Focus
TV focus is a state, not hover emulation.
Focused controls must provide at least two cues among scale, ring, elevation/glow and label reveal. Gold focus cannot obscure poster art or captions. Focus movement must be deterministic with D-pad and restore correctly after returning from details/player.

## Cards
Types: poster, landscape/hero, episode, channel, match, collection, download.
Every card supports loading/error/empty/unavailable states. Provider identity is absent from normal cards.

## Buttons
Primary: Play/Continue.
Secondary: Details/Download/Favorite.
Danger: destructive confirmation.
Advanced Sources is visually secondary and never competes with Play.

## Navigation
Phone: adaptive bottom/navigation rail based on width.
Tablet/foldable: rail + content where appropriate.
TV: persistent/expandable side navigation with deterministic D-pad focus.
Web: responsive rail/sidebar/top controls as viewport demands.
Canonical destinations remain Home, Movies, Series, Anime, Turkish, Live, Sports, Search, Favorites, History, Downloads, Settings.

## Player controls
Controls prioritize play/pause, timeline, audio/subtitles, quality, previous/next and source recovery. Advanced Sources appears only when useful. Auto-next countdown is cancellable. Error UI explains retry/fallback without exposing raw provider internals.

## Motion
Cinematic but short. Motion communicates hierarchy/focus/state rather than decoration. Respect Reduce Motion globally. Splash is brief and cannot block startup on network.

## Responsive breakpoints
Breakpoints are capability/layout decisions, not device-name checks. Compact, medium, expanded and TV-10ft classes must be implemented through layout constraints. Foldables handle hinges/safe regions explicitly where platform APIs expose them.

## Accessibility
Text scaling, screen-reader labels, captions, logical traversal, minimum touch/focus targets, high contrast and Reduce Motion are required from component inception. Color alone cannot communicate live/error/selected/healthy.

## RTL
Arabic RTL is the default test path. Directional icons mirror only when semantics require it. Media timelines, numeric times and video controls follow platform/media conventions rather than naive mirroring.

## Acceptance gates
Before pixel freeze: contrast measurements, Arabic/English/Turkish samples, phone/tablet/foldable/TV screenshots, D-pad traversal map, Reduce Motion capture, player overlay capture and accessibility labels review.
