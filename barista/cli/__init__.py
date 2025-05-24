import click

from barista.cli.build import build
from barista.cli.verify import verify


@click.group()
def cli() -> None:
    pass


cli.add_command(build)
cli.add_command(verify)


def run() -> None:
    cli(auto_envvar_prefix="BARISTA")
