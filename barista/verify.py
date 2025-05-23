"""
Contains logic for verifying objects and outputs.
"""

from typing import Any

from barista.models import EspansoConfigFile, Match


def verify_match(obj: dict[str, Any]) -> None:
    Match.model_validate(obj)


def verify_matches(objs: list[dict[str, Any]]) -> None:
    for obj in objs:
        verify_match(obj)


def verify_espanso_config_file(
    obj: dict[str, Any], verbose: bool = True
) -> EspansoConfigFile:
    try:
        return EspansoConfigFile.model_validate(obj)
    except Exception as e:
        if verbose:
            print(f"Object: {obj}")

        raise e
