# Bash Functions Reference

## Navigation

| Function | Usage | Purpose |
|----------|-------|---------|
| `take` | `take <directory>` | Create a directory and `cd` into it |
| `up` | `up [levels]` | Move up one or more directory levels |
| `cdf` | `cdf <path>` | `cd` to a file's parent or to the given directory |
| `pathadd` | `pathadd <directory>` | Prepend a directory to `PATH` once |

## Archives

| Function | Usage | Purpose |
|----------|-------|---------|
| `extract` | `extract <archive>` | Unpack common archive formats |
| `mktar` | `mktar <archive.tar.gz> <path>...` | Create a gzipped tarball |
| `mkzip` | `mkzip <archive.zip> <path>...` | Create a zip archive |

## Git helpers

| Function | Usage | Purpose |
|----------|-------|---------|
| `gitroot` | `gitroot` | Jump to the current repository root |
| `gnew` | `gnew <branch>` | Create and switch to a new branch |
| `gprune` | `gprune` | Fetch all remotes and prune stale refs |
| `grecent` | `grecent [count]` | Show recently updated branches |
| `gcleanmerged` | `gcleanmerged [base]` | Delete local branches already merged into `base` |

## Python helpers

| Function | Usage | Purpose |
|----------|-------|---------|
| `venv` | `venv [dir]` | Create a Python virtual environment |
| `activatevenv` | `activatevenv [dir]` | Activate a virtual environment |
| `servehere` | `servehere [port]` | Start a quick static file server |
| `pyclean` | `pyclean` | Remove Python cache files and directories |

## System and project helpers

| Function | Usage | Purpose |
|----------|-------|---------|
| `ports` | `ports` | Show listening ports with `ss` or `lsof` |
| `ips` | `ips` | Print local interface addresses |
| `mktempd` | `mktempd` | Create and print a temporary directory |
| `weather` | `weather [location]` | Fetch a text weather report from wttr.in |
| `proj` | `proj <name>` | Create or enter a project in `$PROJECTS_DIR` or `~/src` |
| `workon` | `workon <name>` | Enter an existing project in `$PROJECTS_DIR` or `~/src` |

The Bash config currently ships **22 functions** across navigation, archive,
Git, Python, system, and project workflows. User-defined functions from
`~/.bash_functions` are loaded after these modules so custom behavior can
override repo defaults safely.
