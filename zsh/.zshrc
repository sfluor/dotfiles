# .zshrc



autoload -U compinit; compinit
autoload -U promptinit; promptinit
prompt pure

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:$HOME/.local/bin"

source "$HOME/.git.zsh"
source "$HOME/.aliases"
source "$HOME/.functions"

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -f "$HOME/.gorc" ] && source "$HOME/.gorc"
[ -f "$HOME/.workrc" ] && source "$HOME/.workrc"
[ -x "$(command -v atuin)" ] && eval "$(atuin init zsh)"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
