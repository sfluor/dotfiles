# ZSH Theme settings
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sfluor/robbira"

# Plugins
plugins=(
  git
  z
  zsh-autosuggestions
  docker docker-compose vagrant
  zsh-syntax-highlighting
  extract
  shrink-path
)

source $ZSH/oh-my-zsh.sh

# Use fd for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

source ~/.aliases
source ~/.functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/Vrac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.datadogrc
