venv() {
  local dir="${1:-.venv}"

  command -v python3 >/dev/null 2>&1 || {
    echo "venv: python3 is required" >&2
    return 1
  }

  python3 -m venv "$dir"
}

activatevenv() {
  local dir="${1:-.venv}"

  if [[ ! -r "${dir}/bin/activate" ]]; then
    echo "activatevenv: missing ${dir}/bin/activate" >&2
    return 1
  fi

  # shellcheck source=/dev/null
  . "${dir}/bin/activate"
}

servehere() {
  local port="${1:-8000}"

  if [[ ! "$port" =~ ^[0-9]+$ ]]; then
    echo "usage: servehere [port]" >&2
    return 1
  fi

  command -v python3 >/dev/null 2>&1 || {
    echo "servehere: python3 is required" >&2
    return 1
  }

  python3 -m http.server "$port"
}

pyclean() {
  find . -type d -name '__pycache__' -prune -exec rm -rf {} +
  find . -type f \( -name '*.pyc' -o -name '*.pyo' \) -delete
}

