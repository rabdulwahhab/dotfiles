# Dotfiles

Personal environment configuration managed via a **bare Git repository**.

This repo tracks configuration files directly in `$HOME` without symlinks.

Inspiration: https://medium.com/@augusteo/simplest-way-to-sync-dotfiles-and-config-using-git-14051af8703a

---

# Overview

This setup uses:

* A **bare Git repository** stored at:
  `~/.dotfiles`
* `$HOME` as the working tree
* An alias (`dotfiles`) to interact with the repo

This allows tracking:

* Shell configs (`.zshrc`, `.bashrc`)
* Git config (`.gitconfig`)
* Starship config (`.config/starship.toml`)
* Editor config (`.config/nvim/`)
* Personal scripts (`.local/bin/`)
* Other environment configuration

Without moving files or creating symlinks.

---

# TL;DR

| Action               | Command                  |
| -------------------- | ------------------------ |
| Status               | `dotfiles status`             |
| Add file             | `dotfiles add <file>`         |
| Commit               | `dotfiles commit -m "msg"`    |
| Push                 | `dotfiles push`               |
| Remove from tracking | `dotfiles rm --cached <file>` |
| Show diff            | `dotfiles diff`               |

---

# Initial Setup (New Machine)

## 1. Clone the Bare Repository

```bash
git clone --bare git@github.com:YOURUSER/dotfiles.git $HOME/.dotfiles
```

---

## 2. Define the Alias

Add this to your shell config (`.zshrc` or `.bashrc`):

```bash
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Reload your shell:

```bash
source ~/.zshrc
```

---

## 3. Checkout the Files

```bash
dotfiles checkout
```

If you see conflicts:

* Move conflicting files out of the way
* Re-run `dotfiles checkout`

Example:

```bash
mv ~/.zshrc ~/.zshrc.backup
dotfiles checkout
```

---

## 4. Hide Untracked Files Noise

Prevent Git from showing everything in `$HOME` as untracked:

```bash
dotfiles config --local status.showUntrackedFiles no
```

---

# Daily Usage

## Check Status

```bash
dotfiles status
```

## View Changes

```bash
dotfiles diff
```

## Add a File

```bash
dotfiles add ~/.zshrc
dotfiles commit -m "Update zsh config"
dotfiles push
```

---

# Adding New Configuration

Example: Add Starship config

```bash
dotfiles add ~/.config/starship.toml
dotfiles commit -m "Add starship config"
dotfiles push
```

---

# Removing a File from Tracking

To stop tracking but keep the file:

```bash
dotfiles rm --cached ~/.somefile
dotfiles commit -m "Stop tracking somefile"
```

---

# Removing a File Completely

```bash
dotfiles rm ~/.somefile
dotfiles commit -m "Remove somefile"
```

---

# Adding a Remote (If Needed)

If not already set:

```bash
dotfiles remote add origin git@github.com:YOURUSER/dotfiles.git
dotfiles push -u origin main
```

---

# Recommended Files to Track

* `~/.zshrc`
* `~/.bashrc`
* `~/.gitconfig`
* `~/.config/starship.toml`
* `~/.config/nvim/`
* `~/.local/bin/*`

---

# Files to Never Track

* SSH private keys (`~/.ssh/id_*`)
* Secrets or API keys
* Cache directories (`~/.cache/`)
* Machine-specific environment files
* Large binary files

---

# Optional: Bootstrap Script (Recommended)

Create a small `bootstrap.sh` in this repo to automate setup on new machines:

```bash
#!/usr/bin/env bash

git clone --bare git@github.com:YOURUSER/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Run:

```bash
bash bootstrap.sh
```

---

# Directory Structure (Conceptual)

```
$HOME/
  .zshrc
  .gitconfig
  .config/
  .local/
  .dotfiles/  (bare git repository)
```

`.dotfiles` stores Git metadata only.
Actual configuration files remain in their natural locations.

---

# Migration Notes

If switching machines:

1. Install required tools first (zsh, starship, neovim, etc.)
2. Clone and checkout dotfiles
3. Restart terminal

---

# Philosophy

* Keep configuration explicit.
* Avoid tracking machine-specific state.
* Prefer minimal, readable config.
* Keep this repo small and intentional.
* Treat environment setup as infrastructure.

