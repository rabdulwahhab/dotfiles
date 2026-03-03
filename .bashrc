# Interactive shell configuration goes here.

# Prevent interactive-only code from running in non-interactive contexts
case $- in *i*) ;; *) return ;; esac

# Source shared aliases
[ -f "$HOME/.aliases.sh" ] && . "$HOME/.aliases.sh"
