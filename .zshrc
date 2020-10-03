source ~/antigen.zsh

alias pip=/usr/local/bin/pip3
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use 14.13.0

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme dracula/zsh dracula

antigen apply

