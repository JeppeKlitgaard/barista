from typing import Any, Literal

from pydantic import BaseModel, Extra, root_validator


class MatchVariable(BaseModel, extra=Extra.forbid):
    name: str
    type: str
    params: dict[str, Any]


class Match(BaseModel, extra=Extra.forbid):
    replace: str
    trigger: str | None = None
    triggers: list[str] | None = None
    vars: list[MatchVariable] | None = None
    propagate_case: bool | None = None

    @root_validator
    def check_trigger(cls, values: dict[str, Any]) -> dict[str, Any]:
        match values:
            case {"trigger": None, "triggers": None}:
                raise ValueError("One of `trigger` or `triggers` must be set")

            case _ if values["trigger"] is not None and values["triggers"] is not None:
                raise ValueError("Cannot specify both `trigger` and `triggers`.")

            case _:
                return values


class EspansoConfigFile(BaseModel, extra=Extra.forbid):
    matches: list[Match] | None
    name: str
    parent: str | None

    backend: Literal["Clipboard"] | None = None
    filter_exec: str | None = None
