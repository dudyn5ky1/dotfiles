source ~/antigen.zsh

DISABLE_MAGIC_FUNCTIONS=true
export PATH=/home/pi/.local/bin:$PATH
tput cup $LINES

IS_LINUX=$(uname -a | grep Linux)
if [[ $IS_LINUX ]]
then
  USR_PATH=/usr/bin
else
  USR_PATH=/usr/local/bin
fi

alias pip="$USR_PATH/pip3"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export EDITOR="$USR_PATH/nvim"
export VISUAL="$USR_PATH/nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm use 14.13.0

antigen use oh-my-zsh

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

# Custom aliases
alias v=nvim
alias f="open /Applications/Firefox.app"
alias update="~/scripts/update.sh"
alias rand_hash="~/scripts/get_random_hash.sh"
alias get_quote="~/scripts/get_quotes.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
