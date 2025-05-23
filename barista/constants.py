from pathlib import Path

SRC_PATH = Path("src")
DST_PATH = Path("dist")

CONFIG_FOLDER = "config"
MATCH_FOLDER = "match"

JSONNET_GLOB_PATTERN = str(Path("**") / "*.jsonnet")
JSONNET_GLOB_EXCLUDE_PATTERN = str(Path("**") / "*.example.jsonnet")
YML_GLOB_PATTERN = str(Path("**") / "*.yml")
YAML_GLOB_PATTERN = str(Path("**") / "*.yaml")
