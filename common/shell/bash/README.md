# Bash Configuration

Comprehensive Bash configuration with custom aliases, functions, and keybindings for enhanced productivity.

 
## What's Included

| Component | Location | Purpose |
|-----------|----------|---------|
| Loader files | `.*rc`, `.profile` | Entry points that source modular fragments |
| Prompt configuration | `bash.d/prompt/` | Git-aware prompt with system info |
| Aliases | `bash.d/aliases/` | File, package, git, and system shortcuts (50+) |
| Functions | `bash.d/functions/` | Utilities for archives, git, projects (90+) |
| Keybindings | `bash.d/keybindings/` | Enhanced readline shortcuts |
| Completions | `bash.d/completions/` | Integration with Docker, kubectl, Cloud SDKs |
| Colors | `.dircolors`, `.nanorc` | Custom colors for ls, nano, grep, diff |

## Key Features

- **Smart Prompt**: Git status, disk usage, username, hostname, timestamp
- **Modular Layout**: Edit and add aliases/functions without touching main config
- **90+ Functions**: Archive extraction, Python venvs, git batch operations
- **50+ Aliases**: Grouped by category (files, packages, git, system)
- **Enhanced Keybindings**: History search, word navigation, case-insensitive completion
- **Tool Integration**: Auto-loads configs for Docker, kubectl, GCP, Azure, Node, Go, Poetry

## Documentation

- **[ALIASES.md](ALIASES.md)** – All aliases by category
- **[FUNCTIONS.md](FUNCTIONS.md)** – Complete function reference
- **[KEYBINDINGS.md](KEYBINDINGS.md)** – Keybinding reference

## Requirements

 
**Optional**: fzf, hub, tldr, exa, shellcheck

## Customization

Add custom aliases to `~/.bash_aliases` or functions to `~/.bash_functions`. Create new modular fragments in `bash.d/aliases/` or `bash.d/functions/` and they auto-load in sorted order.

