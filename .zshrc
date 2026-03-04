# Interactive shell configuration goes here (e.g. aliases, functions, prompt init, completion, keybindings, etc.).

# Source shared aliases
[ -f "$HOME/.aliases.sh" ] && . "$HOME/.aliases.sh"

# Source shared shell functions
[ -f "$HOME/.functions.sh" ] && . "$HOME/.functions.sh"

# zsh-only extras
[ -f "$HOME/.functions.zsh" ] && . "$HOME/.functions.zsh"

# load machine-specific overrides (keep this at the bottom)
[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"
