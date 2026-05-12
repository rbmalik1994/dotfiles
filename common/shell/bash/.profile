# Shared Bash login configuration.

__bash_dotfiles_profile_resolve_dir() {
  local source="${BASH_SOURCE[0]}"
  local dir=""

  while [[ -L "$source" ]]; do
    dir="$(cd -P "$(dirname "$source")" && pwd)"
    source="$(readlink "$source")"
    [[ "$source" = /* ]] || source="$dir/$source"
  done

  cd -P "$(dirname "$source")" && pwd
}

__bash_dotfiles_prepend_path() {
  local dir="$1"

  [[ -d "$dir" ]] || return 0

  case ":${PATH}:" in
    *":${dir}:"*) ;;
    *) PATH="${dir}:${PATH}" ;;
  esac
}

__bash_dotfiles_prepend_path "${HOME}/.local/bin"
__bash_dotfiles_prepend_path "${HOME}/bin"

export PATH
export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-$EDITOR}"
export PAGER="${PAGER:-less -FRX}"
export LESSHISTFILE=-

if [[ -n "${BASH_VERSION:-}" ]]; then
  __bash_dotfiles_profile_dir="$(__bash_dotfiles_profile_resolve_dir)"
  if [[ -r "${__bash_dotfiles_profile_dir}/.bashrc" ]]; then
    # shellcheck source=/dev/null
    . "${__bash_dotfiles_profile_dir}/.bashrc"
  fi
  unset __bash_dotfiles_profile_dir
fi

unset -f __bash_dotfiles_prepend_path
unset -f __bash_dotfiles_profile_resolve_dir

