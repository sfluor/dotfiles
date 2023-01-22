vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  -- LSP stuff
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }
  use("Raimondi/delimitMate")
  use("SirVer/ultisnips")
  use("justinmk/vim-sneak")
  use("airblade/vim-gitgutter")
  use("chriskempson/base16-vim")
  use("christoomey/vim-tmux-navigator")
  use("ervandew/supertab")
  use("itchyny/lightline.vim")
  use({ "junegunn/fzf", run = ":call fzf#install()" })
  use("junegunn/fzf.vim")
  use("ntpeters/vim-better-whitespace")
  use("sheerun/vim-polyglot")
  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("tpope/vim-unimpaired")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "fatih/vim-go", cmd = { "GoInstallBinaries" } })
end)
