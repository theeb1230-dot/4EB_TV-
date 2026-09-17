# 4BA Product Constitution

Status: LOCKED product baseline. Technical implementation details may change only when compatibility, security, licensing, or measured engineering evidence requires it.

## Non-negotiable values

- ZERO_COST: core functionality must not require paid infrastructure, subscriptions, billing cards, or a permanently required paid backend.
- ZERO_ADS: no banner, interstitial, popup, pre-roll, advertising SDK, or advertising tracking.
- PRIVACY_FIRST / ZERO_PII: local-first by default. Optional health telemetry must be anonymous and contain no personal information.
- NATIVE_PLAYBACK_FIRST: Android, Android TV, and iOS playback stays inside 4BA. Native HLS/DASH/MP4 first. Internal WebView is a last fallback only. Never open an external browser for normal playback.
- MULTI_PLATFORM: Android Mobile, Android TV, iOS, Web/PWA.
- CONTENT_FIRST: normal users interact with content, not provider names. Advanced source selection remains available.
- LICENSE_AND_SECURITY_FIRST: never copy secrets or credentials into the public repository. If a source license prevents reuse, reimplement compatible behavior clean-room. Do not bypass DRM, paywalls, or access controls.

## Identity and design

- Official default experience: 4BA Cinematic Gold.
- Dark-first cinematic UI for V1. No Light Theme work in V1.
- Official 4BA gold remains the identity accent; alternate Experiences may define their own accent systems.
- Current visual concept is direction, not frozen pixels.
- Before production UI implementation, establish a real Design System covering logo geometry, color tokens, typography, spacing, radius, focus, cards, buttons, navigation, player controls, motion, accessibility, RTL, and responsive rules.
- Arabic is the default language and RTL. English and Turkish are first-class languages.

## Product structure

Primary sections: Home, Movies, Series, Anime, Turkish, Live TV, Sports, Search, Favorites, History, Downloads, Settings.

4BA uses an adaptive hybrid architecture: Core + capability contracts/microkernel + Experience Engine + Provider SDK + independent Metadata Engine + Universal Search/Resolver + health/ranking + local-first storage/cache. A remote/serverless gateway is optional only where technically necessary; core operation must not depend on paid infrastructure.

The 30 source projects are not automatically 30 UIs. Every source is audited and classified as one or more of Experience, Provider, Engine, or Reference. Only real distinctive interfaces become switchable Experiences.

## Locked UX decisions

- Short splash then direct entry; no mandatory onboarding or login.
- Dynamic Home with Hero and reorderable/hideable sections.
- Instant search, voice search, filters, deduplicated unified content results.
- Resolver automatically chooses the best healthy source; advanced users can manually select sources.
- Auto quality plus manual quality when available.
- Watch and Download remain distinct choices whenever a source supports both.
- Details include cast, trailer, ratings, seasons/episodes, similar content, and production metadata when available.
- Remember last season/episode and per-episode progress.
- Continue Watching and Auto Next with countdown/cancel.
- Skip Intro/Recap only with trustworthy timing data.
- On playback failure, try the next valid source before presenting a useful error; preserve playback position when switching sources where possible.
- Subtitle preferences, styling and timing controls; local SRT/VTT import where supported.
- Remember preferred audio language.
- Downloads support quality/audio/subtitle selection, queues, full-season requests, optional storage limits and optional cleanup.
- Favorites, History, delete/clear, Incognito, and local-first recommendations with thumbs up/down.
- Collections are supported by the data model from V1 even if simplified/hidden in the first UI.
- Single Profile in V1; model must support multiple Profiles later.
- Local mode is default. Account is requested only for optional cross-device sync of favorites, history and playback progress.
- Kids Mode is post-MVP, but content classification/filtering architecture begins in V1.
- Backup/export/import of local settings and user library data.

## Live TV and sports

- EPG cache/window: yesterday + today + next 3 days.
- Live Now, Upcoming, Ended, match schedule and configurable notifications.
- Favorite/recent channels and categories.
- Fast TV channel up/down.
- Mobile mini-player.
- Cast session should allow the phone to act as a remote where platform capabilities permit.

## Player

Native player capabilities target: HLS, DASH, MP4, adaptive bitrate, manual quality, audio tracks, subtitles, resume, previous/next episode, auto-next, PiP, Cast/AirPlay, TV D-pad focus, and Data Saver. Web playback remains inside the Web/PWA when browser capabilities and lawful source delivery permit it.

## Platform decisions

- Android minimum baseline is provisionally API 24.
- iOS minimum baseline is provisionally iOS 15.
- Both baselines require a compatibility audit before final freeze.
- Android TV must be a real 10-foot UI, not a scaled phone UI, with D-pad focus, long-press behavior where useful, and cinematic idle/screensaver treatment.
- Web/PWA is a full 4BA experience, not a marketing page.
- Static/free hosting is preferred. GitHub Pages must never be used as a video proxy/backend.

## Updates, diagnostics and reliability

- Stable update channel by default; optional Beta channel.
- No ordinary forced updates. Force only for documented critical security or incompatibility cases.
- Signed remote configuration may update provider ordering/state without an app release, with verification, rollback and provider kill-switch.
- Advanced diagnostics and Developer Mode cover Providers, Streams, EPG, Metadata, Resolver and Health without exposing PII.
- No provider may be a single point of failure; UI must not bind directly to a provider; metadata and stream resolution remain separate.

## Definition of Done

4BA is not complete because it compiles. Golden release requires functional Android Mobile, Android TV, iOS and Web/PWA surfaces; native playback; working core sections; switchable real Experiences; replaceable providers; offline behavior; accessibility/RTL; security/privacy/license audits; automated tests; CI/CD artifacts; and documented failure/rollback tests while preserving ZERO_COST and ZERO_ADS.
