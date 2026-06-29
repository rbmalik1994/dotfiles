#!/bin/sh
set -eu

profile="${1:-minimal}"
extra_modules="${2:-}"
gui_apps="${3:-false}"
script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
repo_dir="$(CDPATH= cd -- "$script_dir/../.." && pwd)"
os="$("$repo_dir/scripts/bootstrap/detect-os.sh")"

info() {
  printf '%s\n' "==> $*"
}

modules_for_profile() {
  case "$1" in
    minimal) printf '%s\n' core ;;
    server) printf '%s\n' core python node server ;;
    python-dev) printf '%s\n' core python ;;
    node-dev) printf '%s\n' core node ;;
    fullstack) printf '%s\n' core python node docker ;;
    personal) printf '%s\n' core python node docker personal ;;
    work) printf '%s\n' core python node docker work ;;
    *) printf '%s\n' core ;;
  esac
}

normalize_extra_modules() {
  printf '%s' "$extra_modules" | tr ',' ' '
}

info "Installing packages for profile '$profile' on '$os'"

modules="$(modules_for_profile "$profile") $(normalize_extra_modules)"

case "$os" in
  macos)
    "$repo_dir/scripts/packages/brew.sh" $modules
    if [ "$gui_apps" = "true" ]; then
      "$repo_dir/scripts/os/macos.sh"
    fi
    ;;
  wsl)
    "$repo_dir/scripts/packages/apt.sh" $modules
    "$repo_dir/scripts/os/wsl.sh"
    ;;
  linux)
    if command -v apt-get >/dev/null 2>&1; then
      "$repo_dir/scripts/packages/apt.sh" $modules
    elif command -v dnf >/dev/null 2>&1; then
      "$repo_dir/scripts/packages/dnf.sh" $modules
    elif command -v pacman >/dev/null 2>&1; then
      "$repo_dir/scripts/packages/pacman.sh" $modules
    else
      printf '%s\n' "No supported package manager found. Skipping packages." >&2
    fi
    "$repo_dir/scripts/os/linux.sh"
    ;;
  *)
    printf '%s\n' "Unsupported OS '$os'. Skipping packages." >&2
    ;;
esac
