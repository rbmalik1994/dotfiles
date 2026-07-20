#!/bin/sh
set -eu

python3 --version 2>/dev/null || true
pipx ensurepath 2>/dev/null || true
