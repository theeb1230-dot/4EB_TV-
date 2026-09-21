# TVmaze attribution and release gate

4BA uses TVmaze only as a metadata/discovery source. TVmaze is not a playback, stream, download, relay, proxy, DRM, paywall, or access-control provider in 4BA.

## Attribution

Metadata supplied by TVmaze must be attributed to TVmaze and linked to https://www.tvmaze.com/ wherever 4BA distributes or displays TVmaze-derived data in a distributable build.

TVmaze states that its API data is licensed under Creative Commons Attribution-ShareAlike. The applicable license is CC BY-SA 4.0: https://creativecommons.org/licenses/by-sa/4.0/

## Release requirements

A distributable 4BA build that enables `tvmaze_provider` MUST NOT be released until all of the following are verified:

1. An in-product legal/about surface visibly credits TVmaze and links to TVmaze.
2. The in-product legal/about surface identifies the CC BY-SA license and links to the license text.
3. Any adaptation or redistribution of TVmaze-derived data is handled consistently with the applicable attribution/share-alike terms.
4. Release evidence records the exact 4BA commit SHA, the TVmaze provider version, and a capture/test proving the attribution surface is reachable.
5. TVmaze remains metadata-only and does not advertise stream/download capability.

This file is legal/release evidence only. Its presence does not satisfy the in-product attribution requirement by itself.
