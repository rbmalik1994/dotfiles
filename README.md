# DotFiles

Cross-platform dotfiles collection and installer templates.

Background
---------
This repository provides a familiar, reproducible structure for managing dotfiles across multiple operating systems (Linux, macOS, Windows). It supports per-OS and per-distro customization and includes templates for multiple Linux window managers (e.g. i3, sway, dwm, GNOME).

Goals
-----
- Provide a consistent layout for configuration files that works on multiple OSes.
- Make it easy to apply OS-specific and distro-specific customizations.
- Ship simple install scripts that bootstrap symlinks and install tips per platform.

Repository structure
--------------------
- `common/`: shared configs (git, shell, editor) used on all platforms. See [common/README.md](common/README.md).
- `linux/`: Linux-specific configs and distro templates. See [linux/README.md](linux/README.md).
- `macos/`: macOS-specific configs and notes. See [macos/README.md](macos/README.md).
- `windows/`: Windows-specific configs and PowerShell scripts. See [windows/README.md](windows/README.md).
- `scripts/`: helper install scripts for each OS.

Quickstart
----------
1. Review files in the directory for your OS: `linux/`, `macos/`, or `windows/`.
2. Inspect `scripts/install.sh` (Linux/macOS) or `scripts/install.ps1` (Windows) before running.

Example (Linux):
```bash
bash scripts/install.sh
```

Contributing
------------
Add new distro templates or WM examples under `linux/` or platform-specific subfolders and update the README files. If you want, I can add examples for a specific distro or WM next.

License
-------
TBA