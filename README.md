# sfluor dotfiles

Those dotfiles are managed using [stow](https://www.gnu.org/software/stow/), if you want to setup some dotfiles just do `stow <directory>`.

If it's the first time that you use the repo you should run the `apply-theme` script on one of the themes of the `themes directory` to generate the configuration files.

For instance: `./scripts/apply-theme themes/snazzy.py`

## Git

`stow git`

To setup the git template directory you can do `git config --global init.templatedir "~/.git_template"`

## Zsh

`stow zsh`

You will need to install:
- [atuin](https://github.com/atuinsh/atuin)
- [zoxide](https://github.com/ajeetdsouza/zoxide): used to jump around instead of using `cd`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [pure](https://github.com/sindresorhus/pure)


## Vim

`stow vim`

The vim configuration is based on [LazyVim](https://www.lazyvim.org/)

## Ghostty

`stow ghostty`

Uses the built-in Catppuccin Latte theme.

## Claude Code

`stow claude`

This links `~/.claude/hooks`. It holds `tmux-claude-state.sh`, which shows the state of a Claude session on its tmux window tab: a yellow `⠿` while it works, a red `!` when it needs you, and a green `●` when it finished while you were in another window. The markers are defined in `tmux/.tmux.conf`.

`~/.claude/settings.json` is not stowed, because Claude Code rewrites it. Add these hooks to it by hand:

```json
"hooks": {
  "UserPromptSubmit": [
    { "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh working" }] }
  ],
  "PreToolUse": [
    {
      "matcher": "AskUserQuestion|ExitPlanMode",
      "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh waiting" }]
    }
  ],
  "PostToolUse": [
    { "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh working" }] }
  ],
  "Notification": [
    {
      "matcher": "permission_prompt|elicitation_dialog",
      "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh waiting" }]
    }
  ],
  "Stop": [
    { "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh done" }] }
  ],
  "StopFailure": [
    { "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh done" }] }
  ],
  "SessionEnd": [
    { "hooks": [{ "type": "command", "command": "~/.claude/hooks/tmux-claude-state.sh clear" }] }
  ]
}
```
