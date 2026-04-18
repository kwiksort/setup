import json
from pathlib import Path
import sys

def patch_karabiner():
    config_path = Path.home() / ".config/karabiner/karabiner.json"
    if not config_path.exists():
        print(f"Config file not found: {config_path}. Skipping patch.")
        return

    try:
        data = json.loads(config_path.read_text())
    except Exception as e:
        print(f"Failed to read or parse config: {e}")
        sys.exit(1)

    target_rule_description = "[MX Keys FR-PC] Ctrl+ASCVXZ => Cmd+ASCVXZ"
    terminal_exclusion = {
        "bundle_identifiers": [
            r"^com\.mitchellh\.ghostty$",
            r"^com\.apple\.Terminal$",
        ],
        "type": "frontmost_application_unless",
    }

    modified = False
    for profile in data.get("profiles", []):
        rules = profile.get("complex_modifications", {}).get("rules", [])
        for rule in rules:
            if rule.get("description") != target_rule_description:
                continue

            for manip in rule.get("manipulators", []):
                from_block = manip.get("from", {})
                key_code = from_block.get("key_code")
                modifiers = from_block.get("modifiers", {})
                mandatory = modifiers.get("mandatory", [])

                if key_code not in {"c", "z"} or "control" not in mandatory:
                    continue

                conditions = manip.setdefault("conditions", [])

                # Clean old typo pattern if present
                for condition in conditions:
                    if condition.get("type") == "frontmost_application_unless":
                        bundles = condition.get("bundle_identifiers", [])
                        condition["bundle_identifiers"] = [
                            b for b in bundles if b != r"^com\.ghotty\..*$"
                        ]

                has_terminal_exclusion = any(
                    condition.get("type") == "frontmost_application_unless"
                    and set(condition.get("bundle_identifiers", []))
                    == set(terminal_exclusion["bundle_identifiers"])
                    for condition in conditions
                )

                if not has_terminal_exclusion:
                    conditions.insert(0, terminal_exclusion.copy())
                
                modified = True

    if modified:
        config_path.write_text(json.dumps(data, indent=4) + "\n")
        print("Successfully applied Karabiner patch.")
    else:
        print("No matching rules found to patch.")

if __name__ == "__main__":
    patch_karabiner()
