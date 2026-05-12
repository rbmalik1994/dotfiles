gitroot() {
  local root=""

  root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "gitroot: not inside a git repository" >&2
    return 1
  }

  cd -- "$root"
}

gnew() {
  if [[ $# -ne 1 ]]; then
    echo "usage: gnew <branch>" >&2
    return 1
  fi

  git switch -c "$1"
}

gprune() {
  git fetch --all --prune --tags
}

grecent() {
  local limit="${1:-10}"

  if [[ ! "$limit" =~ ^[0-9]+$ ]]; then
    echo "usage: grecent [count]" >&2
    return 1
  fi

  git for-each-ref \
    --count="$limit" \
    --sort=-committerdate \
    --format='%(committerdate:relative) %(refname:short)' \
    refs/heads refs/remotes
}

gcleanmerged() {
  local base="${1:-main}"
  local current=""
  local branch=""

  git show-ref --verify --quiet "refs/heads/$base" || {
    echo "gcleanmerged: local branch not found: $base" >&2
    return 1
  }

  current="$(git branch --show-current)"

  while IFS= read -r branch; do
    [[ -n "$branch" ]] || continue
    [[ "$branch" == "$base" || "$branch" == "$current" ]] && continue
    git branch -d "$branch"
  done < <(
    git for-each-ref \
      --format='%(refname:short)' \
      --merged "refs/heads/$base" \
      refs/heads
  )
}

