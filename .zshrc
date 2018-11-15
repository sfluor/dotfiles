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

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
export GOPATH="$HOME/go"
export PATH="$HOME/.cargo/bin:$PATH:$GOPATH/bin"
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# Use fd for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# Docker compose up shortcut
dcu () {
    if [[ $# -eq 0 ]]
    then
        docker-compose up
    else
        docker-compose -f "$1" up
    fi
}

source ~/.aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /Users/sami.tabet/Vrac/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.datadogrc
