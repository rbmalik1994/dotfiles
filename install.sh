#!/bin/sh
set -eu

repo="${DOTFILES_REPO:-robin/dotfiles}"

info() {
  printf '%s\n' "==> $*"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

detect_os() {
  os="$(uname -s 2>/dev/null || printf unknown)"
  case "$os" in
    Darwin) printf macos ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        printf wsl
      else
        printf linux
      fi
      ;;
    *) printf unknown ;;
  esac
}

install_chezmoi() {
  if has chezmoi; then
    return 0
  fi

  info "Installing chezmoi"
  if has sh && has curl; then
    sh -c "$(curl -fsLS get.chezmoi.io)"
    export PATH="$HOME/.local/bin:$PATH"
  elif has sh && has wget; then
    sh -c "$(wget -qO- get.chezmoi.io)"
    export PATH="$HOME/.local/bin:$PATH"
  else
    printf '%s\n' "curl or wget is required to install chezmoi." >&2
    exit 1
  fi
}

main() {
  target_os="$(detect_os)"
  info "Detected system: $target_os"

  install_chezmoi

  if ! has chezmoi; then
    printf '%s\n' "chezmoi was not found after installation." >&2
    exit 1
  fi

  info "Initializing dotfiles from $repo"
  exec chezmoi init --apply "$repo"
}

main "$@"
