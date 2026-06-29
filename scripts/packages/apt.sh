#!/bin/sh
set -eu

if ! command -v apt-get >/dev/null 2>&1; then
  exit 0
fi

packages=""
for module in "$@"; do
  case "$module" in
    core) packages="$packages git curl wget ca-certificates zsh fzf ripgrep fd-find bat jq tmux neovim" ;;
    python) packages="$packages python3 python3-pip pipx" ;;
    node) packages="$packages nodejs npm" ;;
    docker) packages="$packages docker.io docker-compose-plugin" ;;
    server) packages="$packages openssh-client htop" ;;
  esac
done

if [ -z "$packages" ]; then
  exit 0
fi

sudo apt-get update
sudo apt-get install -y $packages
