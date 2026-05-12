Linux configuration, distro templates and window manager examples

Overview
--------
This folder is organized to support multiple distributions and multiple window managers (WMs). Use distro-specific subfolders when packages or install steps differ.

Recommended layout
- `linux/<distro>/` — distro-specific install notes and package lists (`arch/`, `ubuntu/`, `fedora/`).
- `linux/wm/<wm>/` — WM-specific config templates (`i3/`, `sway/`, `dwm/`, `gnome/`).
- `linux/templates/` — helper scripts or sample dotfiles for quick copy.

Example workflow
----------------
1. Pick distro folder (e.g., `linux/arch`).
2. Pick WM folder (e.g., `linux/wm/sway`).
3. Run `scripts/install.sh` to symlink files and run distro-specific package installer.

Notes on differences
- Package managers differ (`pacman` vs `apt` vs `dnf`) — include package lists per-distro.
- Display servers: `sway` (Wayland) vs `i3` (X11) — config formats differ; keep separate templates.

If you want, I can add example files for Arch+i3 and Ubuntu+GNOME next.

