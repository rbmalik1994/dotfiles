ports() {
  if command -v ss >/dev/null 2>&1; then
    ss -tulpn
    return 0
  fi

  if command -v lsof >/dev/null 2>&1; then
    lsof -i -P -n
    return 0
  fi

  echo "ports: requires ss or lsof" >&2
  return 1
}

ips() {
  if command -v hostname >/dev/null 2>&1 && hostname -I >/dev/null 2>&1; then
    hostname -I
    return 0
  fi

  if command -v ip >/dev/null 2>&1; then
    ip -brief addr show up
    return 0
  fi

  echo "ips: requires hostname -I or ip" >&2
  return 1
}

mktempd() {
  mktemp -d "${TMPDIR:-/tmp}/bash.XXXXXX"
}

weather() {
  local location="${1:-}"

  if [[ -n "$location" ]]; then
    curl -fsSL "https://wttr.in/${location}"
    return $?
  fi

  curl -fsSL "https://wttr.in"
}

