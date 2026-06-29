#!/bin/sh
set -eu

os="$(uname -s 2>/dev/null || printf unknown)"

case "$os" in
  Darwin)
    printf '%s\n' macos
    ;;
  Linux)
    if grep -qi microsoft /proc/version 2>/dev/null; then
      printf '%s\n' wsl
    else
      printf '%s\n' linux
    fi
    ;;
  *)
    printf '%s\n' unknown
    ;;
esac
