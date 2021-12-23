# Barista

**Barista** is a tool and substancial collection for leveraging the power of
Unicode and [espanso].

Its current state is very much geared towards my personal setup, but this
may be expanded in the future.

## Triggers

The main advantage of `barista` is that it implements `pretrigger`s and `posttrigger`s programmatically.

Currently:

| Category      | Pretrigger | Posttrigger |
|---------------|------------|-------------|
| Greek letters | `;`        | None        |
| Digraphs      | `,`        | ` `         |
| General       | `:`        | ` `         |

## Usage

While `barista` is still a personal pet-project, it should now be accessible
to those well-versed in the Python eco-system.

To use it, do:

1. Clone this repository
2. Install `barista` using poetry by running `poetry install`
3. Compile using `barista build` (optionally: look at `--output` option)
4. The compiled configuration files can be found in `./dist` and may be copied  
   over to the desired folder

Configuration is primarily done in the `config.jsonnet` file.

## Examples

| Example | Output      | Comment    |
|---------|-------------|------------|
| `;b`    | `β`         | Greek beta |
| `:st `  | `such that` |            |
| `:sansserifbolditaliceta` | `𝞰` | Sans-Serif bold italic eta |

[espanso]: https://espanso.org/
