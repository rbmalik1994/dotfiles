# Shared Bash configuration entrypoint.

[[ -n "${BASH_VERSION:-}" ]] || return 0

case $- in
  *i*) ;;
  *) return 0 ;;
esac

__bash_dotfiles_resolve_dir() {
  local source="${BASH_SOURCE[0]}"
  local dir=""

  while [[ -L "$source" ]]; do
    dir="$(cd -P "$(dirname "$source")" && pwd)"
    source="$(readlink "$source")"
    [[ "$source" = /* ]] || source="$dir/$source"
  done

  cd -P "$(dirname "$source")" && pwd
}

readonly BASH_DOTFILES_ROOT="$(__bash_dotfiles_resolve_dir)"
export BASH_DOTFILES_ROOT
export BASH_DOTFILES_CUSTOM_ALIASES="${HOME}/.bash_aliases"
export BASH_DOTFILES_CUSTOM_FUNCTIONS="${HOME}/.bash_functions"

HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
PROMPT_DIRTRIM=3

shopt -s histappend checkwinsize cmdhist no_empty_cmd_completion

__bash_dotfiles_source_file() {
  local file="$1"
  [[ -r "$file" ]] || return 0
  # shellcheck source=/dev/null
  . "$file"
}

__bash_dotfiles_source_dir() {
  local dir="$1"
  local file=""
  local files=()

  [[ -d "$dir" ]] || return 0

  files=("$dir"/*.sh)
  [[ -e "${files[0]}" ]] || return 0

  for file in "${files[@]}"; do
    [[ -r "$file" ]] || continue
    # shellcheck source=/dev/null
    . "$file"
  done
}

__bash_dotfiles_append_prompt_command() {
  local command="$1"

  if [[ -z "${PROMPT_COMMAND:-}" ]]; then
    PROMPT_COMMAND="$command"
    return 0
  fi

  case ";${PROMPT_COMMAND};" in
    *";${command};"*) ;;
    *) PROMPT_COMMAND="${PROMPT_COMMAND};${command}" ;;
  esac
}

if command -v dircolors >/dev/null 2>&1 && [[ -r "$BASH_DOTFILES_ROOT/.dircolors" ]]; then
  # shellcheck disable=SC1090
  . <(dircolors -b "$BASH_DOTFILES_ROOT/.dircolors")
fi

__bash_dotfiles_source_dir "$BASH_DOTFILES_ROOT/bash.d/aliases"
__bash_dotfiles_source_dir "$BASH_DOTFILES_ROOT/bash.d/functions"
__bash_dotfiles_source_file "$BASH_DOTFILES_CUSTOM_ALIASES"
__bash_dotfiles_source_file "$BASH_DOTFILES_CUSTOM_FUNCTIONS"
__bash_dotfiles_source_dir "$BASH_DOTFILES_ROOT/bash.d/keybindings"
__bash_dotfiles_source_dir "$BASH_DOTFILES_ROOT/bash.d/completions"
__bash_dotfiles_source_dir "$BASH_DOTFILES_ROOT/bash.d/prompt"

unset -f __bash_dotfiles_resolve_dir

