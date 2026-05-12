#!/usr/bin/env bash
set -euo pipefail

# Minimal cross-platform installer script (Linux/macOS).
# Links a small set of shared dotfiles into the home directory.

readonly REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

link_file() {
  local src="$1"
  local dst="$2"

  if [[ -e "$dst" || -L "$dst" ]]; then
    echo "Skipping existing $dst"
    return 0
  fi

  ln -s "$src" "$dst"
  echo "Linked $dst -> $src"
}

install_common_files() {
  link_file "$REPO_ROOT/common/git/gitconfig" "$HOME/.gitconfig"
  link_file "$REPO_ROOT/common/shell/bash/.bashrc" "$HOME/.bashrc"
  link_file "$REPO_ROOT/common/shell/bash/.profile" "$HOME/.profile"
  link_file "$REPO_ROOT/common/shell/bash/.dircolors" "$HOME/.dircolors"
  link_file "$REPO_ROOT/common/shell/bash/.nanorc" "$HOME/.nanorc"
}

case "$(uname -s)" in
  Linux)
    echo "Detected Linux"
    install_common_files
    ;;
  Darwin)
    echo "Detected macOS"
    install_common_files
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac

echo "Install script finished. Edit scripts to suit your repo layout."
