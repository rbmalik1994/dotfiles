#!/bin/sh
set -eu

if ! command -v pacman >/dev/null 2>&1; then
  exit 0
fi

packages=""
for module in "$@"; do
  case "$module" in
    core) packages="$packages git curl wget ca-certificates zsh starship fzf ripgrep fd bat eza jq tmux neovim github-cli" ;;
    python) packages="$packages python python-pipx uv ruff" ;;
    node) packages="$packages nodejs npm pnpm" ;;
    docker) packages="$packages docker docker-compose" ;;
    server) packages="$packages openssh htop" ;;
  esac
done

if [ -z "$packages" ]; then
  exit 0
fi

sudo pacman -Syu --needed --noconfirm $packages
