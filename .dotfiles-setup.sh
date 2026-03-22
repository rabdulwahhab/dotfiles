#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------------------------
# Dotfiles installer (bare repo, work-tree = $HOME)
#
# Assumes this script is being run from an already-cloned dotfiles repo
# (for example by VS Code Dev Containers dotfiles support).
#
# What it does:
#   - Creates a bare repo at: ~/.dotfiles
#   - Ensures origin points to your dotfiles repo
#   - Forces tracked files in $HOME to match the fetched main branch
#   - Hides untracked files from `dot status` (since work-tree is $HOME)
#
# Notes:
#   - This overwrites ONLY tracked files in $HOME.
#   - It does NOT delete untracked files.
# ------------------------------------------------------------------------------

REPO="git@github.com:rabdulwahhab/dotfiles.git"
BARE_DIR="$HOME/.dotfiles"
BRANCH="main"

# Directory containing this script (the normal cloned repo from VS Code)
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dot() {
  git --git-dir="$BARE_DIR" --work-tree="$HOME" "$@"
}

# Create the bare repo if missing, using the already-cloned repo as source
if [ ! -d "$BARE_DIR" ]; then
  git clone --bare "$SRC_DIR" "$BARE_DIR"
fi

# Ensure origin points to the canonical remote
dot remote set-url origin "$REPO" 2>/dev/null || dot remote add origin "$REPO"

# Fetch the desired branch and reset HOME to exactly that fetched state
dot fetch origin "$BRANCH"
dot reset --hard FETCH_HEAD

# Hide untracked files in $HOME
dot config --local status.showUntrackedFiles no
