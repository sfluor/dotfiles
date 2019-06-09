plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker docker-compose vagrant
  extract
  shrink-path
)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.aliases"
source "$HOME/.functions"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.datadogrc" ] && source "$HOME/.datadogrc"
