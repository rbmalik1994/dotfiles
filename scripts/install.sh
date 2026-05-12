#!/usr/bin/env bash
set -euo pipefail

# Minimal cross-platform installer script (Linux/macOS)
# Reads templates and symlinks files into the home directory. Review before running.

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

link_file() {
  src="$1"
  dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "Skipping existing $dst"
  else
    ln -s "$src" "$dst"
    echo "Linked $dst -> $src"
  fi
}

case "$(uname -s)" in
  Linux)
    echo "Detected Linux"
    # Example: symlink common gitconfig
    link_file "$REPO_ROOT/common/git/gitconfig" "$HOME/.gitconfig" || true
    ;;
  Darwin)
    echo "Detected macOS"
    link_file "$REPO_ROOT/common/git/gitconfig" "$HOME/.gitconfig" || true
    ;;
  *)
    echo "Unsupported OS: $(uname -s)"
    exit 1
    ;;
esac

echo "Install script finished. Edit scripts to suit your repo layout."
