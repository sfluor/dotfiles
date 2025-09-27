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


## Vim

`stow vim`

You will need:
- [vim-packer](https://github.com/wbthomason/packer.nvim) to be installed (used to manage vim plugins)
- And you will have to run `:PackerCompile` and `PackerInstall` when starting your vim / neovim session
