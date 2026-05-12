if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first --icons=auto'
  alias l='eza --group-directories-first --icons=auto'
  alias ll='eza -lah --group-directories-first --git --icons=auto'
  alias la='eza -lah --group-directories-first --icons=auto'
  alias lt='eza --tree --level=2 --group-directories-first --icons=auto'
else
  if ls --color=auto >/dev/null 2>&1; then
    alias ls='ls --color=auto -F'
    alias l='ls --color=auto -F'
    alias ll='ls -alFh --color=auto'
    alias la='ls -A --color=auto'
  else
    alias ls='ls -GF'
    alias l='ls -GF'
    alias ll='ls -alGFh'
    alias la='ls -AG'
  fi
  alias lt='ls -1AF'
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cls='clear'
alias dfh='df -h'
alias duh='du -sh'
alias h='history'
alias j='jobs -l'
alias md='mkdir -p'
alias path='tr ":" "\n" <<< "$PATH"'
alias rd='rmdir'
alias reload='source ~/.bashrc'
