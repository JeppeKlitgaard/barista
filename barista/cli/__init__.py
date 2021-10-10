import click

from barista.cli.compile import compile
from barista.cli.find_dupes import find_dupes


@click.group()
def cli() -> None:
    pass


cli.add_command(compile)
cli.add_command(find_dupes)
