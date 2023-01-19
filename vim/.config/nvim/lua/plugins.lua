vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

    use 'Raimondi/delimitMate'
    use 'SirVer/ultisnips'
    use 'justinmk/vim-sneak'
    use 'airblade/vim-gitgutter'
    use 'chriskempson/base16-vim'
    use 'christoomey/vim-tmux-navigator'
    use 'ervandew/supertab'
    use 'honza/vim-snippets'
    use 'itchyny/lightline.vim'
    use { 'junegunn/fzf', run = ":call fzf#install()" }
    use 'junegunn/fzf.vim'
    use 'ntpeters/vim-better-whitespace'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    if vim.fn.executable('go') == 1 then
        use {'fatih/vim-go', cmd = { 'GoInstallBinaries' }}
    end
end)
