__bash_dotfiles_color_enabled() {
  [[ -t 1 && "${TERM:-}" != "dumb" ]]
}

__bash_dotfiles_git_prompt_support() {
  [[ -n "${__bash_dotfiles_git_prompt_loaded:-}" ]] && return 0

  local file=""

  for file in \
    /usr/lib/git-core/git-sh-prompt \
    /usr/share/git/completion/git-prompt.sh \
    /usr/share/git-core/contrib/completion/git-prompt.sh \
    /opt/homebrew/etc/bash_completion.d/git-prompt.sh
  do
    [[ -r "$file" ]] || continue
    # shellcheck source=/dev/null
    . "$file"
    __bash_dotfiles_git_prompt_loaded=1
    return 0
  done

  __bash_dotfiles_git_prompt_loaded=0
  return 1
}

__bash_dotfiles_git_segment() {
  local branch=""
  local dirty=""

  command -v git >/dev/null 2>&1 || return 0
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return 0

  if __bash_dotfiles_git_prompt_support && declare -F __git_ps1 >/dev/null 2>&1; then
    __git_ps1 ' (%s)'
    return 0
  fi

  branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)" || return 0
  if [[ -n "$(git status --porcelain --ignore-submodules=dirty 2>/dev/null)" ]]; then
    dirty="*"
  fi

  printf ' (%s%s)' "$branch" "$dirty"
}

__bash_dotfiles_disk_segment() {
  local usage=""

  usage="$(df -P . 2>/dev/null | awk 'NR == 2 { print $5 }')" || return 0
  [[ -n "$usage" ]] || return 0
  printf ' [%s]' "$usage"
}

__bash_dotfiles_build_prompt() {
  local reset=""
  local cyan=""
  local green=""
  local yellow=""
  local blue=""
  local red=""
  local prompt_char="$"

  if (( EUID == 0 )); then
    prompt_char="#"
  fi

  if __bash_dotfiles_color_enabled; then
    reset='\[\e[0m\]'
    cyan='\[\e[0;36m\]'
    green='\[\e[0;32m\]'
    yellow='\[\e[0;33m\]'
    blue='\[\e[0;34m\]'
    red='\[\e[0;31m\]'
  fi

  PS1="${yellow}[\A]${reset} ${green}\u@\h${reset} ${blue}\w${reset}${cyan}\$(__bash_dotfiles_git_segment)${reset}${red}\$(__bash_dotfiles_disk_segment)${reset}\n${prompt_char} "
}

__bash_dotfiles_append_prompt_command __bash_dotfiles_build_prompt

