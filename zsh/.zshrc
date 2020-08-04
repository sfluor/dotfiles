plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker docker-compose vagrant
  extract
  kubectl
  shrink-path
)

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.local/bin"

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.aliases"
source "$HOME/.functions"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.gorc" ] && source "$HOME/.gorc"
[ -f "$HOME/.datadogrc" ] && source "$HOME/.datadogrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
