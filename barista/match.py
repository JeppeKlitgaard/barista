from __future__ import annotations

from pathlib import Path
from typing import Any, Optional

from barista.utils import load_jsonnet


class Match:
    triggers: list[str]
    replace: str
    origin: Optional[Path]

    def __init__(self, triggers: list[str], replace: str, origin: Path):
        self.triggers = triggers
        self.replace = replace
        self.origin = origin

    def __repr__(self) -> str:
        return f"{self.triggers} -> '{self.replace}'"

    @classmethod
    def from_obj(cls, obj: dict[str, Any], origin: Path) -> Match:
        """
        Constructs and returns a `Match` object from a espanso
        configuration 'matches' entry.

        Optionally has an `origin` attribute.
        """
        triggers: list[str]

        if "triggers" in obj:
            triggers = obj["triggers"]
        elif "trigger" in obj:
            triggers = [obj["trigger"]]
        else:
            raise ValueError(f"Invalid obj from {origin}: {obj}")

        return cls(triggers, obj["replace"], origin)

    @classmethod
    def matches_from_path(cls, path: Path) -> list[Match]:
        obj = load_jsonnet(path)

        matches = []
        for entry in obj["matches"]:
            matches.append(cls.from_obj(entry, path))

        return matches
