proj() {
  local base="${PROJECTS_DIR:-${HOME}/src}"

  if [[ $# -ne 1 ]]; then
    echo "usage: proj <name>" >&2
    return 1
  fi

  mkdir -p -- "${base}/$1" && cd -- "${base}/$1"
}

workon() {
  local base="${PROJECTS_DIR:-${HOME}/src}"

  if [[ $# -ne 1 ]]; then
    echo "usage: workon <name>" >&2
    return 1
  fi

  if [[ ! -d "${base}/$1" ]]; then
    echo "workon: project not found: ${base}/$1" >&2
    return 1
  fi

  cd -- "${base}/$1"
}

