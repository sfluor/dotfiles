export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="oh-my-via/via"

# Plugins
plugins=(
  git
  k
)

source $ZSH/oh-my-zsh.sh

# User configuration

alias tree="tree -C"

# Alias to manage dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

alias sshpi="ssh pi@82.243.4.245 -i ~/.ssh/perso_rsa"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "/$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
export GOPATH="/$HOME/go"
export PATH="$HOME/.cargo/bin:$PATH:$GOPATH/bin"
# The next line enables shell command completion for gcloud.
if [ -f "/$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "/$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# z cd
. /usr/local/bin/z.sh

# Docker compose up shortcut
dcu () {
    if [[ $# -eq 0 ]]
    then
        docker-compose up
    else
        docker-compose -f "$1" up
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
