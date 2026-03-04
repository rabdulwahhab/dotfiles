# Configuration for login shells goes here.

# Source shared env vars
[ -f "$HOME/.env.sh" ] && . "$HOME/.env.sh"

# load machine-specific overrides (keep this at the bottom)
[ -f "$HOME/.zprofile.local" ] && . "$HOME/.zprofile.local"
