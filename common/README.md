Common configuration and shared templates

This folder holds configuration files that apply across operating systems, or that should be kept in sync between them.

Suggested contents
- `git/` — `gitconfig`, `gitignore_global`
- `shell/` — modular Bash config under `shell/bash/`, plus `zshrc` and shared
  shell assets
- `editor/` — `nvim/` or `vim/` settings

Usage
-----
Keep files here OS-agnostic where possible. Platform-specific overrides belong in the corresponding `linux/`, `macos/`, or `windows/` folders.

Example: symlink `~/.gitconfig` to `common/git/gitconfig` from the installer script.
