#!/bin/sh
set -eu

if command -v chezmoi >/dev/null 2>&1; then
  exit 0
fi

if command -v curl >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)"
elif command -v wget >/dev/null 2>&1; then
  sh -c "$(wget -qO- get.chezmoi.io)"
else
  printf '%s\n' "curl or wget is required to install chezmoi." >&2
  exit 1
fi
