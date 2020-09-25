source ~/antigen.zsh

alias pip=/usr/local/bin/pip3
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme dracula/zsh dracula

antigen apply
