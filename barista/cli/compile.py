import os
import shutil

import click
import yaml

from barista.constants import (
    JSONNET_GLOB_PATTERN,
    SRC_PATH,
    TARGET_PATH,
    YAML_GLOB_PATTERN,
    YML_GLOB_PATTERN,
)
from barista.utils import find_files, load_jsonnet
from barista.verify import verify_espanso_config_file


@click.command()
def compile() -> None:
    jsonnet_paths = find_files(SRC_PATH, JSONNET_GLOB_PATTERN)

    map_ = {}
    total_triggers = 0
    total_replacements = 0
    # Compile yaml
    for path in jsonnet_paths:
        print(f"Loading {path}")
        obj = load_jsonnet(path)

        # Verify objects
        ecf_obj = verify_espanso_config_file(obj)
        if ecf_obj.matches is not None:
            total_replacements += len(ecf_obj.matches)
            total_triggers += sum(len(match.triggers_as_list()) for match in ecf_obj.matches)

        # Dump as yaml
        yaml_str = yaml.dump(obj)

        map_[path] = yaml_str

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

    print("-" * 25)
    print(f"💪 Compiled {len(map_)} files.")
    print(f"📦 Moved over {len(map_) + len(yaml_paths)} files.")
    print(f"🔁 Total replacements: {total_replacements}.")
    print(f"🔫 Total triggers: {total_triggers}.")
    print("🎉 All done!")
