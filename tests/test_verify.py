import pytest

from barista.models import Match


def test_both_trigger_and_triggers():
    with pytest.raises(ValueError):
        Match.parse_obj(
            {
                "replace": "asd",
                "trigger": "asd",
                "triggers": ["asd", "abc"],
            }
        )


def test_neither_trigger_or_triggers():
    with pytest.raises(ValueError):
        Match.parse_obj({"replace": "asd"})


def test_trigger():
    Match.parse_obj(
        {
            "replace": "asd",
            "trigger": "ads",
        }
    )


def test_triggers():
    Match.parse_obj(
        {
            "replace": "asd",
            "triggers": ["ads", "ads2"],
        }
    )
