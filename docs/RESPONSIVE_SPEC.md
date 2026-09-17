# 4BA Responsive Specification

Status: V1 layout contract.

4BA uses capability/layout classes rather than separate business logic per screen size.

- **Compact:** single primary content column, bottom navigation where suitable, mini-player supported.
- **Medium:** increased content density; navigation rail may replace bottom navigation.
- **Expanded:** rail/sidebar plus multi-column content/details where useful.
- **TV 10ft:** dedicated focus-first composition, larger typography/targets, wider cinematic rows and remote-only operability.

Foldables must respond to available panes and display features rather than assuming a large tablet. Safe areas, keyboard, text scaling and orientation changes cannot hide primary playback/navigation actions.

Experiences can alter composition within these constraints but must expose the same canonical capability states and navigation safety.
