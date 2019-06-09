# dotfiles

Sfluor dotfiles

To link the dotfiles simply execute the `dotfiles.sh` script in your home directory:
`wget -O - https://raw.githubusercontent.com/sfluor/dotfiles/master/dotfiles.sh | sh -`

## Git

To setup the git template directory you can do `git config --global init.templatedir "~/.git_template"`

## Zsh

- Install `zsh-autosuggestions`: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Instal `zsh-syntax-highlighting`: `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`


## Vim

### Plugins

You will need [vim-plug](https://github.com/junegunn/vim-plug) to be installed (used to manage vim plugins)
