import click

from barista.cli.find_dupes import find_dupes
from barista.cli.compile import compile


@click.group()
def cli():
    pass


cli.add_command(compile)
cli.add_command(find_dupes)
