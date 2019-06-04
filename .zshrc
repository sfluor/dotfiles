plugins=(
  git
  z
  zsh-autosuggestions
  docker docker-compose vagrant
  extract
  shrink-path
)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.aliases"
source "$HOME/.functions"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
source ~/Vrac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/.datadogrc"
