import os
import shutil

import click

from barista.constants import (
    JSONNET_GLOB_PATTERN,
    SRC_PATH,
    TARGET_PATH,
    YAML_GLOB_PATTERN,
    YML_GLOB_PATTERN,
)
from barista.utils import find_files, get_yaml_str_from_jsonnet_path


@click.command()
def compile() -> None:
    jsonnet_paths = find_files(SRC_PATH, JSONNET_GLOB_PATTERN)

    map_ = {}
    # Compile yaml
    for path in jsonnet_paths:
        print(f"Loading {path}")
        map_[path] = get_yaml_str_from_jsonnet_path(path)

    # Copy over jsonnet compiled files
    for path, content in map_.items():
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".jsonnet")]
        bits[-1] += ".yml"

        target = TARGET_PATH.joinpath(*bits)

        os.makedirs(target.parent, exist_ok=True)
        with open(target, "w") as f:
            f.write(content)

    # Copy over yaml files
    yaml_paths = [*find_files(SRC_PATH, YML_GLOB_PATTERN), *find_files(SRC_PATH, YAML_GLOB_PATTERN)]
    for path in yaml_paths:
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".yml").removesuffix("*.yaml")]
        bits[-1] += ".yml"

        target = TARGET_PATH.joinpath(*bits)

        os.makedirs(target.parent, exist_ok=True)
        shutil.copy2(path, target)
        print(f"Copying over {path}")

    print(f"💪 Compiled {len(map_)} files.")
    print(f"📦 Moved over {len(map_) + len(yaml_paths)} files.")
    print("🎉 All done!")
