local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[blue]%}%n%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[green]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local kubecontext='%{$terminfo[bold]$fg[blue]%}$(kubectl config current-context)%{$reset_color%}'
local ret_status="%(?:%{$fg_bold[green]%}↳ :%{$fg_bold[red]%}↳ )"

PROMPT="${user_host} ${current_dir} ${git_branch} ${kubecontext}
${ret_status} "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
