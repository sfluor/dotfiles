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

# Helper to print time taken by commands
# From: https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function preexec() {
  cmd_start_time=$(($(date +%s%0N)/1000000))
}

function precmd() {
    if [ $cmd_start_time ]; then
        now=$(($(date +%s%0N)/1000000))
        local d_ms=$(($now - $cmd_start_time))
        local d_s=$((d_ms / 1000))
        local ms=$((d_ms % 1000))
        local s=$((d_s % 60))
        local m=$(((d_s / 60) % 60))
        local h=$((d_s / 3600))

        if   ((h > 0)); then elapsed=${h}h${m}m
        elif ((m > 0)); then elapsed=${m}m${s}s
        elif ((s > 9)); then elapsed=${s}.$(printf %03d $ms | cut -c1-2)s # 12.34s
        elif ((s > 0)); then elapsed=${s}.$(printf %03d $ms)s # 1.234s
        else elapsed=${ms}ms
        fi

        unset cmd_start_time
    else
        unset elapsed
    fi

    # To ensure that hitting return does not just print the previous time
    if [[ -n "$elapsed" ]]; then
        export RPROMPT="%F{$MAGENTA}${elapsed} %{$reset_color%}"
    else
        export RPROMPT=""
    fi

}


if [ -x "$(command -v kubectl)" ]; then
    local kubeprompt='%F{$BLUE}$(kubecontext)/%F{$CYAN}$(kubenamespace $(kubecontext))'
else
    local kubepromt=''
fi

suspended_jobs() {
    if [ -z "$(jobs)" ]; then
        echo ""
    else
        echo "Suspended: {$(jobs | cut -d" " -f6 | tr "\n" "," | sed "s/,$//")}"
    fi
}

local suspended_jobs_prompt='%F{$GREEN}$(suspended_jobs)'

local ret_status="%(?:%B%F{$MAGENTA}>%F{$BLUE}>%F{$CYAN}>%b:%F{$RED}>>>) %F{$WHITE}"

PROMPT="${user_host}${current_dir} ${git_branch}${kubeprompt} ${suspended_jobs_prompt} ${return_code}
${ret_status} "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{$YELLOW}["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
