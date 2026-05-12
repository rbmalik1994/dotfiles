# AGENTS.md

## Purpose

This file provides a concise bootstrap for AI agents (Copilot-style assistants) to be immediately productive in this repository. It links to authoritative docs rather than duplicating them — follow the "link, don't embed" principle.

## Quick Agent Checklist

- **Read:** Repository README and platform READMEs: [README.md](README.md), [common/README.md](common/README.md), [linux/README.md](linux/README.md), [macos/README.md](macos/README.md), [windows/README.md](windows/README.md).
- **Follow:** Organization-wide instruction files in [.github/instructions/](.github/instructions/) (agent, prompt, skill, documentation, markdown, shell, powershell, task-implementation).
- **Search:** Use these patterns to locate agent specs and prompts: `**/*.agent.md`, `**/*.prompt.md`, `**/SKILL.md`, `.github/copilot-instructions.md`, `AGENTS.md`.
- **Respect:** `applyTo` rules inside `.github/instructions/*` when producing or modifying instruction files.

## What agents should do first

- Inventory top-level docs and install scripts: [scripts/install.sh](scripts/install.sh), [scripts/install.ps1](scripts/install.ps1).
- Identify platform-specific files under `common/`, `linux/`, `macos/`, `windows/` and link rather than copy content.
- Link to relevant instruction files before implementing changes (see [.github/instructions/](.github/instructions/) list).

## Example prompts (quick-start)

- "Find install steps and required packages for Linux; summarize commands to bootstrap a fresh machine."
- "List all `.agent.md` and `SKILL.md` files and extract their `applyTo` patterns."
- "Draft `.github/copilot-instructions.md` that references relevant docs and shows one example agent workflow."

## Next customization ideas

- Add `.github/copilot-instructions.md` if you prefer a dedicated Copilot instructions file (this repo uses AGENTS.md as the bootstrap).
- Create example `.agent.md` and `.prompt.md` templates under `.github/` for common tasks (testing, docs, release notes).

## Where to look (authoritative sources)

- [.github/instructions/agent.instructions.md](.github/instructions/agent.instructions.md)
- [.github/instructions/agent-skills.instructions.md](.github/instructions/agent-skills.instructions.md)
- [.github/instructions/documentation.instructions.md](.github/instructions/documentation.instructions.md)
- [.github/instructions/task-implementation.instructions.md](.github/instructions/task-implementation.instructions.md)

---
If you'd like, I can: extract exact command lines into a checklist, create a `.github/copilot-instructions.md`, or draft example agent/prompts — which should I do next?

## Setup Commands

Below are quick, copy-paste commands and workflow notes to get contributors and agents started.

- **Bootstrap (Linux/macOS):** Run the repo's installer script to provision dotfiles and recommended tools.

```bash
bash scripts/install.sh
```

- **Bootstrap (Windows PowerShell):** Open an elevated PowerShell and run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

- **View platform notes:** Read platform-specific READMEs: [linux/README.md](linux/README.md), [macos/README.md](macos/README.md), [windows/README.md](windows/README.md).

## Development Workflow

- **Branching model:** Use feature branches off `main` named `feat/<short-desc>` or `fix/<issue-number>-<short-desc>`.
- **Pull requests:** Open a PR to `main`. Include a short description, screenshots (if relevant), and link issues.
- **Review checklist:** Ensure tests (if any) pass, linting/formatting applied, and documentation updated for notable changes.
- **Commit messages:** Use imperative style, e.g., "Add i3 config for arch" or "Fix install script permissions".

## Code Style Guidelines

- **Formatting:** Run language-specific formatters where applicable (e.g., `prettier`, `black`, `gofmt`). Keep changes minimal and focused.
- **Shell scripts:** Follow POSIX-compatible patterns where possible. Use `shellcheck` for linting.
- **Dotfiles content:** Prefer clear, small, well-documented snippets. Keep platform-specific differences in the `linux/`, `macos/`, and `windows/` folders.
- **Documentation:** Update README files when behavior or setup instructions change. Keep examples runnable and short.

## Contributing

- **Issues:** Open an issue to propose large changes or document a bug before implementing.
- **PRs:** Keep pull requests small and focused. Describe the rationale and any manual steps required to verify changes.
- **Code of conduct & license:** Follow the repository license and any contributor guidelines in repository root (if present).
- **Contact:** Tag maintainers in PRs or open an issue for questions. If you'd like, I can draft a PR template or CONTRIBUTING.md.

---
If you'd like me to also create `.github/copilot-instructions.md`, a `CONTRIBUTING.md`, or PR templates, tell me which and I'll add them.
