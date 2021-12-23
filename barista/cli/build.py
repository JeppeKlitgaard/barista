import os
from pathlib import Path
import shutil

import click
import yaml

from barista.constants import (
    JSONNET_GLOB_PATTERN,
    SRC_PATH,
    DST_PATH,
    YAML_GLOB_PATTERN,
    YML_GLOB_PATTERN,
)
from barista.utils import find_files, load_jsonnet
from barista.verify import verify_espanso_config_file


@click.command()
@click.argument(
    "src",
    nargs=-1,
    type=click.Path(exists=True, resolve_path=True, readable=True, path_type=Path),
)
@click.option(
    "-o",
    "--output",
    "dst",
    envvar="BUILD_DST",
    type=click.Path(file_okay=False, resolve_path=True, writable=True, path_type=Path),
    default=DST_PATH,
    show_default=True,
    help="where to put rendered files",
)
@click.option(
    "-c",
    "--clear/--no-clear",
    help="DANGER: clear distination folder",
    default=False,
    show_default=True,
)
def build(src: list[Path], dst: Path, clear: bool) -> None:
    """
    Builds the jsonnet files in `SRC`s and outputs them to `DST`.
    """
    if not src:
        src = [SRC_PATH]

    jsonnet_paths = []
    for path in src:
        jsonnet_paths.extend(find_files(path, JSONNET_GLOB_PATTERN))

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

    if clear:
        print(f"Clearing directory: {dst}")
        shutil.rmtree(dst)

    # Copy over jsonnet compiled files
    for path, content in map_.items():
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".jsonnet")]
        bits[-1] += ".yml"

        target = dst.joinpath(*bits)

        os.makedirs(target.parent, exist_ok=True)
        with open(target, "w") as f:
            f.write(content)

    # Copy over yaml files
    yaml_paths = [*find_files(SRC_PATH, YML_GLOB_PATTERN), *find_files(SRC_PATH, YAML_GLOB_PATTERN)]
    for path in yaml_paths:
        bits = list(path.parts[1:-1]) + [path.parts[-1].removesuffix(".yml").removesuffix("*.yaml")]
        bits[-1] += ".yml"

        target = dst.joinpath(*bits)

        os.makedirs(target.parent, exist_ok=True)
        shutil.copy2(path, target)
        print(f"Copying over {path}")

    print("-" * 25)
    print(f"💪 Compiled {len(map_)} files.")
    print(f"📦 Moved over {len(map_) + len(yaml_paths)} files to `{dst}`.")
    print(f"🔁 Total replacements: {total_replacements}.")
    print(f"🔫 Total triggers: {total_triggers}.")
    print("🎉 All done!")
