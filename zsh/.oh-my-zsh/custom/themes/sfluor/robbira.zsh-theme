# vim: set syntax=zsh:

local return_code="%(?..%F{$RED_256}%? ↵)"

if [[ $UID -eq 0 ]]; then
    local user_host="%F{$RED_256}%n% "
else
    local user_host=''
fi

# Enable vi mode
bindkey -v

# Restore common used bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Custom RPROMPT using the current vi mode
function zle-line-init zle-keymap-select {
    if [ $KEYMAP = vicmd ]; then
        # Command mode
        MODE="%F{$GREEN_256}[N]%{$reset_color%} "
    else
        MODE="   "
    fi

    RPS1="${MODE} %B${return_code}%b"
    zle reset-prompt
}

# Bind zle events
zle -N zle-line-init
zle -N zle-keymap-select

# Set keytimeout to 100ms
export KEYTIMEOUT=1

local current_dir='%F{$GREEN_256}$(shrink_path -f)'
local git_branch='$(git_prompt_info)'

local kubeprompt='%F{$BLUE_256}$(kubecontext)/%F{$CYAN_256}$(kubenamespace $(kubecontext))'
local ret_status="%(?:%F{$MAGENTA_256}❯%F{$BLUE_256}❯%F{$CYAN_256}❯ :%F{$RED_256}❯❯❯ )"

PROMPT="${user_host}${current_dir} ${git_branch} ${kubeprompt}
${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$YELLOW_256}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
