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

################
###  Colors ####
################

export BACKGROUND="#121419"

# Snazzy color scheme colors
export WHITE='#f1f1f0'
export GREY='#282a36'
export RED='#ff5c57'
export GREEN='#5af78e'
export YELLOW='#f3f99d'
export BLUE='#57c7ff'
export MAGENTA='#ff6ac1'
export CYAN='#9aedfe'

# ----

source $ZSH/oh-my-zsh.sh
export EDIITOR="vim"

# Use fd for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

source ~/.aliases
source ~/.functions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/Vrac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.datadogrc
