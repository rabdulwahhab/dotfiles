# All shared shell aliases go here. This file is `source`'d by bash and zsh.
# Credits:
# - https://github.com/mathiasbynens/dotfiles
# - https://github.com/alrra/dotfiles

# Dotfiles config
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd..="cd .."

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# bin aliases
alias cp="cp -iv"
#             │└─ list copied files
#             └─ prompt before overwriting an existing file
alias mkdir="mkdir -pv"
#                   │└─ list created directories
#                   └─ create intermediate directories
alias mv="mv -iv"
#             │└─ list moved files
#             └─ prompt before overwriting an existing file
alias rm="rm -rf --"
alias l="ls"
alias ll="ls -lAh"
alias lll="ls -ltrA"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# git shortcuts
alias ga='git add'
alias gs='git status'

# Miscellaneous
alias weather="curl http://wttr.in"

# local aliases override (keep this at the bottom)
[ -f "$HOME/.aliases.local.sh" ] && . "$HOME/.aliases.local.sh"
