# vim: set syntax=zsh:

local return_code="%(?..%F{$RED}[code:%?])"

if [[ $UID -eq 0 ]] || [[ "$(whoami)" != "$ROBBIRA_USER" ]]; then
    local user_host="%B%F{$RED}%n%  %b"
else
    local user_host=''
fi

# Restore common used bindings
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Set keytimeout to 100ms
export KEYTIMEOUT=1

local current_dir='%F{$GREEN}$(shrink_path -f)'
local git_branch='$(git_prompt_info)'

if [ -x "$(command -v kubectl)" ]; then
    local kubeprompt='%F{$BLUE}$(kubecontext)/%F{$CYAN}$(kubenamespace $(kubecontext))'
else
    local kubepromt=''
fi
local ret_status="%(?:%B%F{$MAGENTA}>%F{$BLUE}>%F{$CYAN}>%b:%F{$RED}>>>) %F{$WHITE}"

PROMPT="${user_host}${current_dir} ${git_branch}${kubeprompt} ${return_code}
${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$YELLOW}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
