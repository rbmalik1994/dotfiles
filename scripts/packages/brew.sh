#!/bin/sh
set -eu

if ! command -v brew >/dev/null 2>&1; then
  printf '%s\n' "Homebrew is required for macOS package installation." >&2
  printf '%s\n' "Install it from https://brew.sh/ and rerun chezmoi apply." >&2
  exit 0
fi

packages=""
for module in "$@"; do
  case "$module" in
    core) packages="$packages git curl zsh starship fzf ripgrep fd bat eza jq tmux neovim gh" ;;
    python) packages="$packages python pipx uv ruff" ;;
    node) packages="$packages node pnpm" ;;
    docker) packages="$packages docker docker-compose" ;;
  esac
done

for package in $packages; do
  if ! brew list "$package" >/dev/null 2>&1; then
    brew install "$package"
  fi
done
