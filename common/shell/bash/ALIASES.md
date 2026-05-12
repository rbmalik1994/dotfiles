# Bash Aliases Reference

## File and shell aliases

| Alias | Expands to | Purpose |
|-------|------------|---------|
| `ls` | `eza ...` or `ls ...` | Colorized directory listing with a portable fallback |
| `l` | `eza ...` or `ls ...` | Short listing shortcut |
| `ll` | `eza -lah ...` or `ls -al...` | Long listing with hidden files |
| `la` | `eza -lah ...` or `ls -A...` | Hidden-file listing |
| `lt` | `eza --tree ...` or `ls -1AF` | Quick tree-style or one-entry-per-line view |
| `..` | `cd ..` | Move up one directory |
| `...` | `cd ../..` | Move up two directories |
| `....` | `cd ../../..` | Move up three directories |
| `cls` | `clear` | Clear the terminal |
| `dfh` | `df -h` | Human-readable disk usage |
| `duh` | `du -sh` | Summarize a path size |
| `h` | `history` | Show shell history |
| `j` | `jobs -l` | Show background jobs with PIDs |
| `md` | `mkdir -p` | Create directories recursively |
| `path` | `printf ...` | Print `$PATH` one entry per line |
| `rd` | `rmdir` | Remove an empty directory |
| `reload` | `source ~/.bashrc` | Reload the active shell config |

## Git aliases

| Alias | Expands to | Purpose |
|-------|------------|---------|
| `g` | `git` | Short Git entrypoint |
| `ga` | `git add` | Stage changes |
| `gb` | `git branch` | List or manage branches |
| `gc` | `git commit` | Create a commit |
| `gca` | `git commit --amend` | Amend the last commit |
| `gcl` | `git clone` | Clone a repository |
| `gco` | `git checkout` | Checkout branch or files |
| `gd` | `git diff` | Show diffs |
| `gl` | `git pull --ff-only` | Pull without merge commits |
| `glg` | `git log --oneline --decorate --graph --all` | Compact graph view |
| `gp` | `git push` | Push changes |
| `grs` | `git restore` | Restore tracked content |
| `gst` | `git status -sb` | Compact status with branch |
| `gsw` | `git switch` | Switch branches |

The Bash config currently ships **30 aliases** split across general shell and Git
workflows. User-defined overrides in `~/.bash_aliases` are loaded afterward so
local shortcuts can replace or extend these defaults.
