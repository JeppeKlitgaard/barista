import ast
import _jsonnet
from pathlib import Path
import yaml
from typing import Any, TypeVar

from barista.constants import GLOB_PATTERN


T = TypeVar("T")


def unescape(str) -> str:
    """
    Unescapes a string using `ast.literal_eval`
    """
    return ast.literal_eval(str)


def get_yaml_str_from_jsonnet_path(path: Path) -> str:
    """
    Returns the correct yaml-formatted string from a jsonnet
    file.
    """
    raw_str = _jsonnet.evaluate_file(str(path))
    yaml_str = unescape(raw_str)

    return yaml_str


def load_jsonnet_yaml(path: Path) -> dict[str, Any]:
    """
    Returns a Python object with the computed contents of a Jsonnet file
    set up using `std.manifestYamlDoc(...)`.
    """
    yaml_str = get_yaml_str_from_jsonnet_path(path)
    obj = yaml.safe_load(yaml_str)

    return obj


def find_duplicates(l: list[T]) -> list[T]:
    """
    Returns a list of the duplicate elements of `l`.
    """
    seen = []
    dupes = set()

    for i in l:
        if i in seen:
            dupes.add(i)
        else:
            seen.append(i)

    return list(dupes)


def find_jsonnets(src_path: Path) -> list[Path]:
    """
    Returns a list of path objects to jsonnet objects
    below the target path.
    """
    files = src_path.glob(GLOB_PATTERN)
    paths = [Path(x) for x in files]

    return paths