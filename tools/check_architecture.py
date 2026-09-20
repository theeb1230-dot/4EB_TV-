#!/usr/bin/env python3
"""Fail CI when foundational 4BA package dependencies violate layer boundaries."""
from __future__ import annotations
import re, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
PACKAGES = ROOT / "packages"
ALLOWED: dict[str, set[str]] = {
    "core_domain": set(),
    "design_tokens": set(),
    "provider_sdk": {"core_domain"},
    "metadata_engine": {"core_domain"},
    "capability_kernel": {"core_domain"},
    "resolver_engine": {"core_domain", "provider_sdk"},
    "experience_contract": {"core_domain", "capability_kernel", "design_tokens"},
    "presentation_contract": {"design_tokens"},
    "flutter_presentation": {"design_tokens", "presentation_contract"},
    "local_data_memory": {"core_domain"},
    "local_data_codec": {"core_domain"},
    "local_data_persistent": {"core_domain", "local_data_codec"},
    "local_data_flutter": {"local_data_persistent"},
    "playback_orchestrator": {"core_domain", "provider_sdk", "resolver_engine"},
}
PACKAGE_IMPORT = re.compile(r"package:([a-zA-Z0-9_]+?)/")
PATH_DEP = re.compile(r"^\s{2}([a-zA-Z0-9_]+):\s*$")

def manifest_dependencies(pubspec: Path) -> set[str]:
    lines = pubspec.read_text(encoding="utf-8").splitlines()
    in_dependencies = False
    found: set[str] = set()
    for line in lines:
        if line == "dependencies:":
            in_dependencies = True
            continue
        if in_dependencies and line and not line.startswith(" "):
            break
        if not in_dependencies:
            continue
        match = PATH_DEP.match(line)
        if match and match.group(1) in ALLOWED:
            found.add(match.group(1))
    return found

def source_imports(package_dir: Path, own_name: str) -> set[str]:
    found: set[str] = set()
    lib_dir = package_dir / "lib"
    if not lib_dir.exists():
        return found
    for dart_file in lib_dir.rglob("*.dart"):
        text = dart_file.read_text(encoding="utf-8")
        found.update(name for name in PACKAGE_IMPORT.findall(text)
                     if name in ALLOWED and name != own_name)
    return found

def main() -> int:
    errors: list[str] = []
    discovered = {p.name for p in PACKAGES.iterdir()
                  if p.is_dir() and (p / "pubspec.yaml").exists()}
    missing_policy = discovered - ALLOWED.keys()
    missing_package = ALLOWED.keys() - discovered
    if missing_policy:
        errors.append(f"packages missing architecture policy: {sorted(missing_policy)}")
    if missing_package:
        errors.append(f"policy references missing packages: {sorted(missing_package)}")
    for name in sorted(discovered & ALLOWED.keys()):
        package_dir = PACKAGES / name
        manifest = manifest_dependencies(package_dir / "pubspec.yaml")
        imports = source_imports(package_dir, name)
        actual = manifest | imports
        forbidden = actual - ALLOWED[name]
        undeclared_imports = imports - manifest
        if forbidden:
            errors.append(f"{name}: forbidden foundational dependencies {sorted(forbidden)}")
        if undeclared_imports:
            errors.append(f"{name}: imports undeclared package dependencies {sorted(undeclared_imports)}")
        print(f"{name}: {sorted(actual)}")
    if errors:
        print("Architecture boundary violations:", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return 1
    print("Architecture dependency graph matches policy.")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
