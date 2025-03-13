import pytest

from barista.models import Match


def test_both_trigger_and_triggers():
    with pytest.raises(ValueError):
        Match.model_validate(
            {
                "replace": "asd",
                "trigger": "asd",
                "triggers": ["asd", "abc"],
            }
        )


def test_neither_trigger_or_triggers():
    with pytest.raises(ValueError):
        Match.model_validate({"replace": "asd"})


def test_trigger():
    Match.model_validate(
        {
            "replace": "asd",
            "trigger": "ads",
        }
    )


def test_triggers():
    Match.model_validate(
        {
            "replace": "asd",
            "triggers": ["ads", "ads2"],
        }
    )
