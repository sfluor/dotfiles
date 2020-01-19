#################
###  Theming ####
#################

# ------
# Colors
# ------
export BACKGROUND="#121419"
export BACKGROUND_256="16"

# Snazzy color scheme colors and the 256 closest color
export WHITE='#f1f1f0'
export WHITE_256='231'
export GREY='#282a36'
export GREY_256='236'
export RED='#ff5c57'
export RED_256='203'
export GREEN='#5af78e'
export GREEN_256='84'
export YELLOW='#f3f99d'
export YELLOW_256='228'
export BLUE='#57c7ff'
export BLUE_256='81'
export MAGENTA='#ff6ac1'
export MAGENTA_256='205'
export CYAN='#9aedfe'
export CYAN_256='123'

# ------------------
# ZSH Theme settings
# ------------------
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="sfluor/robbira"


##############
###  Misc ####
##############

export EDIITOR="vim"
export ROBBIRA_USER="sami.tabet"

# Use fd for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# Add gopath to the PATH
export PATH=$PATH:$HOME/go/bin/

export JAVA_HOME=/usr/lib/jvm/java-13-openjdk

unset GOOS;
unset GOARCH;
export GOROOT="$HOME/.gimme/versions/go1.13.linux.amd64";
export PATH="$HOME/.gimme/versions/go1.13.linux.amd64/bin:${PATH}";

export GIMME_ENV="$HOME/.gimme/envs/go1.13.linux.amd64.env";
