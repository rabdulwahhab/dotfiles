# Interactive shell configuration goes here.

# Prevent interactive-only code from running in non-interactive contexts
case $- in *i*) ;; *) return ;; esac

# Source shared aliases
[ -f "$HOME/.aliases.sh" ] && . "$HOME/.aliases.sh"

# Source shared shell functions
[ -f "$HOME/.functions.sh" ] && . "$HOME/.functions.sh"

# bash-only extras
[ -f "$HOME/.functions.bash" ] && . "$HOME/.functions.bash"

# load machine-specific overrides (keep this at the bottom)
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
