# vim: set syntax=zsh:

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[blue]%}%n%{$reset_color%}'
else
    local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
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
        MODE="%{$fg[green]%}[NORMAL]%{$reset_color%}"
    else
        # Insert mode
        MODE="%{$fg[blue]%}[INSERT]%{$reset_color%}"
    fi

    RPS1="${MODE} %B${return_code}%b"
    zle reset-prompt
}

# Bind zle events
zle -N zle-line-init
zle -N zle-keymap-select

# Set keytimeout to 100ms
export KEYTIMEOUT=1

local current_dir='%{$terminfo[bold]$fg[green]%}$(shrink_path -f)%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

kubecontext() {
    kubectl config current-context
}

# kubenamespace takes the current context and returns the current namespace
kubenamespace() {
    kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${1}\")].context.namespace}"
}

local kubeprompt='%{$terminfo[bold]$fg[blue]%}$(kubecontext)/$(kubenamespace $(kubecontext))%{$reset_color%}'
local ret_status="%(?:%{$fg_bold[green]%}↳ :%{$fg_bold[red]%}↳ )"

PROMPT="${user_host} ${current_dir} ${git_branch} ${kubeprompt}
${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
