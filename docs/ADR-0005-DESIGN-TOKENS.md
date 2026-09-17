# ADR-0005: Semantic design tokens and Experience overrides

Status: Accepted.

4BA components consume semantic tokens rather than literal Experience colors/sizes. Cinematic Gold supplies the default token set. Alternate Experiences may override approved accent/layout tokens only.

Experiences cannot override accessibility minimums, focus semantics, error/live meaning, RTL behavior, player safety controls, privacy indicators or destructive-action semantics. This preserves distinct visual personalities without forking product behavior.
