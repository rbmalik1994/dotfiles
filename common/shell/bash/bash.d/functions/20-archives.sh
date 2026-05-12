extract() {
  if [[ $# -ne 1 ]]; then
    echo "usage: extract <archive>" >&2
    return 1
  fi

  if [[ ! -f "$1" ]]; then
    echo "extract: file not found: $1" >&2
    return 1
  fi

  case "$1" in
    *.tar.bz2|*.tbz2) tar -xjf "$1" ;;
    *.tar.gz|*.tgz) tar -xzf "$1" ;;
    *.tar.xz|*.txz) tar -xJf "$1" ;;
    *.tar) tar -xf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.gz) gunzip "$1" ;;
    *.rar) unrar x "$1" ;;
    *.zip) unzip "$1" ;;
    *.7z) 7z x "$1" ;;
    *)
      echo "extract: unsupported archive: $1" >&2
      return 1
      ;;
  esac
}

mktar() {
  if [[ $# -lt 2 ]]; then
    echo "usage: mktar <archive.tar.gz> <path> [path ...]" >&2
    return 1
  fi

  local archive="$1"
  shift
  tar -czf "$archive" "$@"
}

mkzip() {
  if [[ $# -lt 2 ]]; then
    echo "usage: mkzip <archive.zip> <path> [path ...]" >&2
    return 1
  fi

  local archive="$1"
  shift
  zip -r "$archive" "$@"
}

