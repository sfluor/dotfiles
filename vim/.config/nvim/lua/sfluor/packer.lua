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
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- LSP status in the status line
            { 'j-hui/fidget.nvim' },
        }
    }
    use("Raimondi/delimitMate")
    use("airblade/vim-gitgutter")
    use("chriskempson/base16-vim")
    use("christoomey/vim-tmux-navigator")
    use("itchyny/lightline.vim")

    use 'vim-test/vim-test'

    -- Debugger
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "folke/neodev.nvim" } }

    -- Theme
    use "rebelot/kanagawa.nvim"

    -- Smooth scrolling !
    use 'psliwka/vim-smoothie'

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use("ntpeters/vim-better-whitespace")
    use("tpope/vim-commentary")
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb") -- github
    use("tpope/vim-surround")
    use("tpope/vim-unimpaired")
    use("catppuccin/nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "nvim-treesitter/playground", run = ":TSInstall query" })
    use("mbbill/undotree")
    use('echasnovski/mini.files')
    use 'nvim-tree/nvim-web-devicons' -- also requires https://www.nerdfonts.com/font-downloads
    use 'github/copilot.vim'
    use 'luckasRanarison/tailwind-tools.nvim'
    use 'wuelnerdotexe/vim-astro' -- For Astro projects
end)
