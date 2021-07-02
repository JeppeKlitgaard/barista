import click

from barista.constants import SRC_PATH, TARGET_PATH
from barista.utils import find_jsonnets, get_yaml_str_from_jsonnet_path

from pathlib import Path

@click.command()
def compile():
    paths = find_jsonnets(SRC_PATH)

    map_ = {}
    for path in paths:
        print(f"Loading {path}")
        map_[path] = get_yaml_str_from_jsonnet_path(path)


    # Copy over files
    for path, content in map_.items():
        raw_bits = path.parts[1:]
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".jsonnet")]

        target = TARGET_PATH / "user" / ("_".join(bits) + ".yml")

        with open(target, "w") as f:
            f.write(content)

    # Copy over "default.yml"
    with open(SRC_PATH / "default.yml") as f:
        default_yml = f.read()

    with open(TARGET_PATH / "default.yml", "w") as f:
        f.write(default_yml)

    print(f"💪 Compiled {len(map_)} files.")
    print(f"📦 Moved over {len(map_) + 1} files.")
    print("🎉 All done!")
