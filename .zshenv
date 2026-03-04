# Configuration for every zsh invocation (including non-interactive/login shells) goes here.
# Keep minimal; avoid slow stuff; usually only exports required for all zsh processes.

# load machine-specific overrides (keep this at the bottom)
[ -f "$HOME/.zshenv.local" ] && . "$HOME/.zshenv.local"
