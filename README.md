# nix-flakes-templates

These are the collections that I am using to bootstrap the development environment for projects that are not using [Nix](https://nixos.org/) and [Flakes](https://nixos.wiki/wiki/Flakes).

Use the `nix flake init` command to bootstrap. See [here](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#flake-references) when you want to init from a specific branch or commit. Find the list of supported templates in the [flake.nix](./flake.nix) file at the repository's root (see the keys in the `templates` field). Example:

```sh
nix flake init -t github:shihanng/nix-flakes-templates#python
```

I often use this together with [direnv](https://direnv.net/), i.e., I have the following in the `.envrc` file.

```sh
use flake
```

I will have the tools (the compiler, LSP, linter, formatter, etc.) I need to develop when I am in the project directory.

## Python

For Python, I usually use the [Python layout](https://direnv.net/man/direnv-stdlib.1.html#codelayout-python-ltpythonexegtcode) in addition to Flakes in direnv.

```sh
use flake
layout python
```
