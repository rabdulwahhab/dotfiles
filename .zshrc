export CLICOLOR=1
export LSCOLORS=GxcxDxHxBxegedabagaced

# Add my scripts
export PATH=$PATH:~/rayscripts

# define prompt
PROMPT='%F{150}%2~%f %(?.%F{42}>%f.%F{9}%? ✗%f) '

# Welcome sequence
printf "$(tput setaf 13)// Welcome\n$(tput setaf 7)"
BABASHKA="/usr/local/bin/bb"
if [ -f "$BABASHKA" ]; then
  capitals.clj
fi

# SH zshrc sync
source ~/.zshrc-import

# git shortcuts
alias ga='git add'
alias gs='git status'

# bin aliases
alias python='python3'
alias pip='pip3'
alias nightcode='java -jar ~/Documents/Nightcode-2.8.3.jar'
alias c='clear'
alias l="ls"
alias v='vim'
alias ..='cd ..'
alias cd..='..'
alias vzshrc='vim ~/.zshrc'
alias loadzshrc='source ~/.zshrc'
alias java_home='/usr/libexec/java_home'

# location shortcuts
alias desktop='cd ~/Desktop/'
alias www='cd ~/www/'
alias resume='cd ~/Documents/Resume/'
alias prog='cd ~/Programming/'
alias rw='cd ~/www/rayyweb/'
alias harar='www && cd harariach/'

# Application shortcuts
alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
alias ff='open /Applications/Firefox.app'
alias messages='open /Applications/Messages.app'
alias o.='open .'

# Miscellaneous
## MISC
alias weather="curl http://wttr.in"

# SSH shortcuts
alias khouryssh='ssh rayyan3@login.ccs.neu.edu'
alias serval="ssh ray@72.4.38.66 -p 3449"
alias hyena="ssh hyena"
alias hyena-port="echo $'Port 8080 is now being tunneled for this session.\n' && ssh -L 8080:localhost:8080 -p 3449 ray@47.7.169.172"

# alias nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opam configuration
test -r /Users/rayyan/.opam/opam-init/init.zsh && . /Users/rayyan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

