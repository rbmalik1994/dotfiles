#!/bin/sh
set -eu

if ! command -v dnf >/dev/null 2>&1; then
  exit 0
fi

packages=""
for module in "$@"; do
  case "$module" in
    core) packages="$packages git curl wget ca-certificates zsh fzf ripgrep fd-find bat jq tmux neovim gh" ;;
    python) packages="$packages python3 python3-pip pipx" ;;
    node) packages="$packages nodejs npm" ;;
    docker) packages="$packages docker docker-compose" ;;
    server) packages="$packages openssh-clients htop" ;;
  esac
done

if [ -z "$packages" ]; then
  exit 0
fi

sudo dnf install -y $packages
