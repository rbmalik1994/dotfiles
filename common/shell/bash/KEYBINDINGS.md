# Bash Keybindings Reference

## Readline settings

| Setting | Effect |
|---------|--------|
| `bell-style none` | Disable the terminal bell |
| `colored-stats on` | Colorize completion metadata |
| `completion-ignore-case on` | Match completion candidates case-insensitively |
| `completion-map-case on` | Treat `-` and `_` more flexibly in completions |
| `completion-query-items 200` | Wait longer before prompting about large completion sets |
| `mark-symlinked-directories on` | Add trailing slash for symlinked directories |
| `menu-complete-display-prefix on` | Keep shared prefixes visible during menu completion |
| `show-all-if-ambiguous on` | Show completions without requiring a second tab |
| `show-all-if-unmodified on` | Show choices when the line has not changed |
| `visible-stats on` | Show file-type hints in completions |

## Key maps

| Key | Action |
|-----|--------|
| `Up` / `Ctrl-P` | Search backward through history using the current prefix |
| `Down` / `Ctrl-N` | Search forward through history using the current prefix |
| `Home` | Jump to the beginning of the line |
| `End` | Jump to the end of the line |
| `Ctrl-Left` | Move backward one word |
| `Ctrl-Right` | Move forward one word |
| `Delete` | Delete the character under the cursor |

These bindings are loaded from `bash.d/keybindings/10-readline.sh` so you can add
more fragments later without editing the main loader files.
