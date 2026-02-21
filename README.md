# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Works on **macOS (Apple Silicon)** and **Windows (WSL2)**.

## What's included

| Package | Description |
| -- | -- |
| `fish` | Fish shell config with OS detection, abbreviations |
| `kitty` | Kitty terminal with Catppuccin Macchiato theme |
| `git` | Global git config with sensible defaults |
| `devbox` | Global Devbox packages (dev tools managed via Nix) |

## Quick start

### Fresh machine (no go-task)

```bash
git clone git@github.com:10gbrand/Dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

This installs Homebrew (macOS) or apt packages (WSL), go-task, devbox, stow, and symlinks everything.

### Already have go-task

```bash
git clone git@github.com:10gbrand/Dotfiles.git ~/dotfiles
cd ~/dotfiles
task bootstrap
```

## Manual usage

```bash
# Install all dotfiles
task dotfiles:install

# Install a single package
cd ~/dotfiles && stow fish

# Remove all symlinks
task dotfiles:uninstall

# After adding new files, restow
task dotfiles:reinstall
```

## Available tasks

Run `task` or `task --list` to see all commands:

| Task | Description |
|------|-------------|
| `task bootstrap` | Full setup on a new machine |
| `task bootstrap:deps` | Install core dependencies only |
| `task dotfiles:install` | Symlink all dotfiles |
| `task dotfiles:uninstall` | Remove all symlinks |
| `task dotfiles:reinstall` | Restow (after adding files) |
| `task fish:reload` | Reload fish config |
| `task update` | Git pull + restow |

## Adding new configs

1. Create a directory matching the package name:
   ```
   mkdir -p ~/dotfiles/newpkg/.config/newpkg/
   ```
2. Add your config files inside, mirroring the path from `$HOME`
3. Add the package name to `PACKAGES` in `Taskfile.yml`
4. Run `task dotfiles:reinstall`

## OS-specific config

Fish config detects the OS automatically via `$IS_MAC` and `$IS_WSL` variables.
Add conditional blocks in `config.fish` or create separate files in `conf.d/`.

## Tools

This setup assumes the following toolchain:

- **[Fish](https://fishshell.com/)** – Shell
- **[Kitty](https://sw.kovidgoyal.net/kitty/)** – Terminal
- **[Devbox](https://www.jetify.com/devbox)** – Development environments
- **[UV](https://docs.astral.sh/uv/)** – Python project management
- **[Go-Task](https://taskfile.dev/)** – Task runner
- **[GNU Stow](https://www.gnu.org/software/stow/)** – Symlink manager

## AI-assisted development

This repo is maintained with help from Claude (Anthropic). When working with Claude on this repo:

- All config changes are documented in this README
- Claude internal files (`.claude/`) are excluded from version control
- Markdown is used for all documentation
