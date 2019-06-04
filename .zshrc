# Plugins
plugins=(
  git
  z
  zsh-autosuggestions
  docker docker-compose vagrant
  extract
  shrink-path
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/Vrac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.datadogrc
