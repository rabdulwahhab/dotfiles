#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------------------
# Dotfiles installer (bare repo, work-tree = $HOME)
#
# What it does:
#   - Ensures a bare git repo exists at: ~/.dotfiles
#   - Ensures origin points to your dotfiles repo
#   - Forces your tracked dotfiles in $HOME to match: origin/main
#   - Hides untracked files from `dot status` (since work-tree is $HOME)
#
# Safe/unsafe notes:
#   - This overwrites ONLY tracked files with the versions from origin/main.
#   - It does NOT delete untracked files in $HOME.
#
# Requirements:
#   - git installed
#   - network access to the repo (SSH key or HTTPS auth)
# ------------------------------------------------------------------------------

REPO="git@github.com:rabdulwahhab/dotfiles.git"
BARE_DIR="$HOME/.dotfiles"
BRANCH="main"

# Helper function so we don't rely on shell aliases being set up yet.
dot() {
  git --git-dir="$BARE_DIR" --work-tree="$HOME" "$@"
}

# 1) Create the bare repo if it doesn't exist
if [ ! -d "$BARE_DIR" ]; then
  git clone --bare "$REPO" "$BARE_DIR"
fi

# 2) Ensure the remote URL is correct (idempotent)
# If origin exists, update it; otherwise add it.
dot remote set-url origin "$REPO" 2>/dev/null || dot remote add origin "$REPO"

# 3) Fetch and force your HOME to match the remote main branch
dot fetch origin "$BRANCH"
dot reset --hard "origin/$BRANCH"

# 4) Hide untracked files (otherwise `dotfiles status` would show your entire HOME)
dot config --local status.showUntrackedFiles no
