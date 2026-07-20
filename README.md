# Dotfiles

Highly modular, cross-platform dotfiles powered by [chezmoi](https://www.chezmoi.io/).

This repo is designed for one-command setup across macOS, Linux, and WSL while keeping every config area easy to find and customize.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/robin/dotfiles/main/install.sh | sh
```

For local development:

```sh
./install.sh
```

The installer detects the current OS, installs `chezmoi` when needed, then runs `chezmoi init --apply`.

## Layout

```text
configs/      Human-edited config library grouped by purpose
templates/    Reusable template snippets and helper notes
data/         Profile, module, OS, and package definitions
modules/      Capability modules such as python, node, server, work
scripts/      Bootstrap, package, OS, and dev setup scripts
```

Root-level `chezmoi` files stay intentionally thin. They render the final files in `$HOME` from `configs/`, selected profile data, and module settings.

## Profiles

Default profiles:

- `minimal`: shell, Git, Starship, and core CLI tools
- `server`: terminal-first setup for remote machines
- `python-dev`: Python tooling with editor support
- `node-dev`: Node tooling with editor support
- `fullstack`: Python, Node, Docker, and editor tooling
- `personal`: fullstack plus personal defaults
- `work`: fullstack plus work defaults

During setup, choose a profile and optionally add extra modules.

## Common Commands

```sh
chezmoi diff
chezmoi apply
chezmoi data
chezmoi doctor
```

## Notes

- Native Windows is intentionally deferred; WSL is supported first.
- Secrets are not stored in this repo yet.
- Package installation scripts are idempotent and safe to rerun.
