"""
Contains logic for verifying objects and outputs.
"""
from typing import Any

from barista.models import EspansoConfigFile, Match


def verify_match(obj: dict[str, Any]) -> None:
    Match.parse_obj(obj)


def verify_matches(objs: list[dict[str, Any]]) -> None:
    for obj in objs:
        verify_match(obj)


def verify_espanso_config_file(obj: dict[str, Any], verbose: bool = True) -> None:
    try:
        EspansoConfigFile.parse_obj(obj)
    except Exception as e:
        if verbose:
            print(f"Object: {obj}")

        raise e
