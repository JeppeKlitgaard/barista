from typing import Any, Literal

from pydantic import BaseModel, ConfigDict, model_validator


class MatchVariable(BaseModel):
    name: str
    type: str
    params: dict[str, Any]

    model_config = ConfigDict(extra="forbid")


class Match(BaseModel):
    replace: str
    trigger: str | None = None
    triggers: list[str] | None = None
    vars: list[MatchVariable] | None = None
    propagate_case: bool | None = None

    model_config = ConfigDict(extra="forbid")

    @model_validator(mode="before")
    @classmethod
    def check_trigger(cls, values: dict[str, Any]) -> dict[str, Any]:
        assert isinstance(values, dict)

        trigger = values.get("trigger")
        triggers = values.get("triggers")

        match (trigger, triggers):
            case (None, None):
                raise ValueError("One of `trigger` or `triggers` must be set")

            case _ if trigger is not None and triggers is not None:
                raise ValueError("Cannot specify both `trigger` and `triggers`.")

            case _:
                return values

    def triggers_as_list(self) -> list[str]:
        if self.triggers is not None:
            return self.triggers

        if self.trigger is not None:
            return [self.trigger]

        return []

class EspansoConfigFile(BaseModel):
    matches: list[Match] | None = None
    name: str
    parent: str | None = None

    backend: Literal["Clipboard"] | None = None
    filter_exec: str | None = None

    model_config = ConfigDict(extra="forbid")
