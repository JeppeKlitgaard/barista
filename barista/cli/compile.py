import os

import click

from barista.constants import CONFIG_FOLDER, SRC_PATH, TARGET_PATH
from barista.utils import find_jsonnets, get_yaml_str_from_jsonnet_path


@click.command()
def compile() -> None:
    paths = find_jsonnets(SRC_PATH)

    map_ = {}
    for path in paths:
        print(f"Loading {path}")
        map_[path] = get_yaml_str_from_jsonnet_path(path)

    # Copy over files
    for path, content in map_.items():
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".jsonnet")]
        bits[-1] += ".yml"

        target = TARGET_PATH.joinpath(*bits)

        os.makedirs(target.parent, exist_ok=True)
        with open(target, "w") as f:
            f.write(content)

    # Copy over "config/default.yml"
    with open(SRC_PATH / CONFIG_FOLDER / "default.yml") as f:
        default_yml = f.read()

    with open(TARGET_PATH / CONFIG_FOLDER / "default.yml", "w") as f:
        f.write(default_yml)

    print(f"💪 Compiled {len(map_)} files.")
    print(f"📦 Moved over {len(map_) + 1} files.")
    print("🎉 All done!")
