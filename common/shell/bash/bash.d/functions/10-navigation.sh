take() {
  if [[ $# -ne 1 ]]; then
    echo "usage: take <directory>" >&2
    return 1
  fi

  mkdir -p -- "$1" && cd -- "$1"
}

up() {
  local levels="${1:-1}"
  local index=0

  if [[ ! "$levels" =~ ^[0-9]+$ ]]; then
    echo "usage: up [levels]" >&2
    return 1
  fi

  while (( index < levels )); do
    cd .. || return 1
    ((index += 1))
  done
}

cdf() {
  if [[ $# -ne 1 ]]; then
    echo "usage: cdf <path>" >&2
    return 1
  fi

  if [[ -d "$1" ]]; then
    cd -- "$1"
    return 0
  fi

  cd -- "$(dirname -- "$1")"
}

pathadd() {
  if [[ $# -ne 1 ]]; then
    echo "usage: pathadd <directory>" >&2
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "pathadd: directory not found: $1" >&2
    return 1
  fi

  case ":${PATH}:" in
    *":$1:"*) ;;
    *) export PATH="$1:${PATH}" ;;
  esac
}

