# Bash Configuration

Portable Bash configuration with modular aliases, functions, keybindings,
completions, and a Git-aware prompt.

## What's included

| Component | Location | Purpose |
|-----------|----------|---------|
| Loader files | `common/shell/bash/.bashrc`, `common/shell/bash/.profile` | Entry points for interactive and login shells |
| Prompt configuration | `common/shell/bash/bash.d/prompt/` | Timestamped prompt with Git and disk usage context |
| Aliases | `common/shell/bash/bash.d/aliases/` | General shell and Git shortcuts |
| Functions | `common/shell/bash/bash.d/functions/` | Navigation, archive, Git, Python, and project helpers |
| Keybindings | `common/shell/bash/bash.d/keybindings/` | Readline behavior and history search bindings |
| Completions | `common/shell/bash/bash.d/completions/` | Optional completions for common developer tools |
| Colors | `common/shell/bash/.dircolors`, `common/shell/bash/.nanorc` | Optional color tuning for GNU `ls` and `nano` |

## Key features

- **Prompt**: Shows time, `user@host`, current directory, Git branch, and
  current filesystem usage
- **Modular layout**: Loads `*.sh` fragments in sorted order from `bash.d/`
- **Aliases**: Ships 30 aliases across directory navigation and Git workflows
- **Functions**: Ships 22 helper functions for day-to-day terminal tasks
- **Keybindings**: Adds prefix-based history search and quality-of-life readline
  settings
- **Optional integrations**: Auto-loads completions for Docker, GitHub CLI,
  Helm, Kind, kubectl, Poetry, gcloud, and Azure CLI when available

## Installation

Use `scripts/install.sh` to symlink the Bash files into your home directory, or
link them manually:

```bash
ln -s "$PWD/common/shell/bash/.bashrc" "$HOME/.bashrc"
ln -s "$PWD/common/shell/bash/.profile" "$HOME/.profile"
ln -s "$PWD/common/shell/bash/.dircolors" "$HOME/.dircolors"
ln -s "$PWD/common/shell/bash/.nanorc" "$HOME/.nanorc"
```

If you already have one of those files, merge changes manually instead of
replacing your existing config.

## Documentation

- **[ALIASES.md](ALIASES.md)** - Alias reference grouped by category
- **[FUNCTIONS.md](FUNCTIONS.md)** - Function usage and behavior
- **[KEYBINDINGS.md](KEYBINDINGS.md)** - Readline settings and key maps

## Optional tools

- `7z`, `unzip`, `zip`, `unrar` for archive helpers
- `eza` for richer directory listings
- `lsof` as a fallback when `ss` is unavailable
- `python3` for virtualenv and local server helpers

## Customization

Add personal aliases to `~/.bash_aliases` or functions to `~/.bash_functions`.
New repo-managed fragments can be dropped into `bash.d/aliases/`,
`bash.d/functions/`, `bash.d/keybindings/`, `bash.d/completions/`, or
`bash.d/prompt/`; they load automatically in lexical order.
