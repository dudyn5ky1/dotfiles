. ~/.zshenv

source ~/antigen.zsh
export NODE_OPTIONS=--max_old_space_size=8192
if [ -f /zscaler.pem ]; then
  export NODE_EXTRA_CA_CERTS=~/zscaler.pem
fi


DISABLE_MAGIC_FUNCTIONS=true
export PATH=/home/pi/.local/bin:$PATH
tput cup $LINES

# Fix for Pi
IS_LINUX=$(uname -a | grep Linux)
if [[ $IS_LINUX ]]
then
  USR_PATH=/usr/bin
else
  USR_PATH=/usr/local/bin
fi

# Set nvim as default editor
export EDITOR="$USR_PATH/nvim"
export VISUAL="$USR_PATH/nvim"

# Lazy load NVM
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

antigen use oh-my-zsh

antigen bundle mroth/evalcache
antigen bundle lukechilds/zsh-nvm
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle timer
antigen bundle z
antigen bundle frontend-search
# angular something
# caniuse something
antigen bundle jira
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jira
antigen bundle lol
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/lol
antigen bundle osx
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/osx

antigen bundle postgres
# stoppost - stop psql server
# startpost - start psql server

antigen bundle rails
# rs - rails server
# REP - RAILS_ENV=production
antigen bundle thefuck
# ESC - ESC - fix previuos command line command

antigen theme dracula/zsh dracula

antigen apply

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
alias pip=$(which pip3)
if command -v pyenv 1>/dev/null 2>&1; then
  # eval "$(pyenv init -)"
  _evalcache pyenv init -
fi
# Custom aliases
alias v=~/nvim-osx64/bin/nvim
alias f="open /Applications/Firefox.app"
alias update="~/scripts/update.sh"
alias rand_hash="~/scripts/get_random_hash.sh"
alias get_quote="~/scripts/get_quotes.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/md/.ghcup/env" ] && source "/Users/md/.ghcup/env" # ghcup-env
