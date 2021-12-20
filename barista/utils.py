import json
from pathlib import Path
from typing import Any, TypeVar

import _jsonnet

T = TypeVar("T")


def load_jsonnet(path: Path) -> dict[str, Any]:
    """
    Returns a Python object with the computed contents of a `jsonnet` file.
    """
    path_str = str(path.resolve())
    json_str = _jsonnet.evaluate_file(path_str)

    obj: dict[str, Any] = json.loads(json_str)

    return obj


def find_duplicates(lst: list[T]) -> list[T]:
    """
    Returns a list of the duplicate elements of `l`.
    """
    seen = []
    dupes = set()

    for i in lst:
        if i in seen:
            dupes.add(i)
        else:
            seen.append(i)

    return list(dupes)


def find_files(src_path: Path, glob_pattern: str) -> list[Path]:
    """
    Returns a list of path objects to the files matching the glob pattern.

    Searches in `src_path`
    """
    files = src_path.glob(glob_pattern)
    paths = [Path(file) for file in files]

    return paths
