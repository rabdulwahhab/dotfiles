# Bash login shell configuration goes here.

# Source shared env vars and interactive shell config
[ -f "$HOME/.env.sh" ] && . "$HOME/.env.sh"
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# load machine-specific overrides (keep this at the bottom)
[ -f "$HOME/.bash_profile.local" ] && . "$HOME/.bash_profile.local"
