import json
from pathlib import Path
from typing import Any, TypeVar

import _gojsonnet as jsonnet

T = TypeVar("T")


def load_jsonnet(path: Path) -> dict[str, Any]:
    """
    Returns a Python object with the computed contents of a `jsonnet` file.
    """
    path_str = str(path.resolve())
    json_str = jsonnet.evaluate_file(path_str)

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


def find_files(
    src_path: Path, glob_pattern: str, glob_exclude_pattern: str | None = None
) -> list[Path]:
    """
    Returns a list of path objects to the files matching the glob pattern.

    Searches in `src_path`
    """
    files_all = src_path.glob(glob_pattern)
    excludes = src_path.glob(glob_exclude_pattern) if glob_exclude_pattern else []
    files = list(set(files_all) - set(excludes))
    paths = [Path(file) for file in files]

    return paths
