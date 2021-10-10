import click

from barista.constants import SRC_PATH
from barista.match import Match
from barista.utils import find_duplicates, find_jsonnets


def _get_all_matches() -> list[Match]:
    """
    Returns all the matches from the source directory.
    """
    matches = []

    paths = find_jsonnets(SRC_PATH)

    for path in paths:
        print(f"Loading {path}")
        # Fixes don't have any matches
        try:
            matches.extend(Match.matches_from_path(path))
        except KeyError:
            print(f"🤔 No matches found in {path}")
            continue

    return matches


@click.command()
def find_dupes() -> None:
    """
    Find the duplicate triggers.
    """
    matches = _get_all_matches()

    # First construct list of all triggers
    triggers = []
    for match in matches:
        triggers.extend(match.triggers)

    dupes = find_duplicates(triggers)

    duped_matches: dict[str, list[Match]] = {}
    for match in matches:
        overlap = [i for i in match.triggers if i in dupes]

        if overlap:
            i = overlap[0]

            if i in duped_matches:
                duped_matches[i].append(match)
            else:
                duped_matches[i] = [match]

    if len(duped_matches):
        print(f"😥 Found {len(duped_matches)} duplicates!")
        for duped_key, ms in duped_matches.items():
            print(f"'{duped_key}' is a duplicate in:")
            for m in ms:
                print(f"- {m.origin}")
    else:
        print("🎉 Found no duplicates!")
