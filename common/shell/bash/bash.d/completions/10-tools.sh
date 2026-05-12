__bash_dotfiles_source_first() {
  local file=""

  for file in "$@"; do
    [[ -r "$file" ]] || continue
    # shellcheck source=/dev/null
    . "$file"
    return 0
  done

  return 1
}

__bash_dotfiles_source_first \
  /usr/share/bash-completion/bash_completion \
  /etc/bash_completion \
  /opt/homebrew/etc/profile.d/bash_completion.sh

__bash_dotfiles_source_first \
  /usr/share/git/completion/git-completion.bash \
  /usr/share/bash-completion/completions/git \
  /opt/homebrew/share/git-core/contrib/completion/git-completion.bash >/dev/null 2>&1 || true

if command -v docker >/dev/null 2>&1 && ! complete -p docker >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(docker completion bash)
fi

if command -v gh >/dev/null 2>&1 && ! complete -p gh >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(gh completion -s bash)
fi

if command -v helm >/dev/null 2>&1 && ! complete -p helm >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(helm completion bash)
fi

if command -v kind >/dev/null 2>&1 && ! complete -p kind >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(kind completion bash)
fi

if command -v kubectl >/dev/null 2>&1 && ! complete -p kubectl >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(kubectl completion bash)
fi

if command -v poetry >/dev/null 2>&1 && ! complete -p poetry >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(poetry completions bash)
fi

__bash_dotfiles_source_first \
  "${HOME}/google-cloud-sdk/completion.bash.inc" \
  /usr/share/google-cloud-sdk/completion.bash.inc >/dev/null 2>&1 || true

if command -v az >/dev/null 2>&1 && az completion -s bash >/dev/null 2>&1 && ! complete -p az >/dev/null 2>&1; then
  # shellcheck disable=SC1090
  . <(az completion -s bash)
fi

unset -f __bash_dotfiles_source_first
