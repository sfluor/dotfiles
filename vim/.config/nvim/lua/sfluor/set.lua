-------------------
-- General settings
-------------------
-- Display numbers
vim.opt.number = true

-- Disable column cursor
vim.opt.cursorcolumn = false

-- Keep buffers hidden when not used
vim.opt.hidden = true

-- Use UTF8
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"

-- Update if file is modificated outside vim
vim.opt.autoread = true

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ":w<CR>", { desc = '[W]rite buffer' })

-- Spaces instead of tabs and be smart with tabs, one tab == 4 spaces
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Autoindent
vim.opt.autoindent = true

-- View replacements dynamically
vim.opt.inccommand = "split"

vim.opt.ai = true   -- auto indent
vim.opt.si = true   -- smart indent
vim.opt.wrap = true -- wrap lines

-- Incremental search and smart case
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Command line wild menu for command completions
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Show matching brackets / braces
vim.opt.showmatch = true

-- Enable scrolling on all modes
vim.opt.mouse = "a"

-- True color support
vim.opt.termguicolors = true

-- Keep cursor at the center
vim.opt.scrolloff = 9999

-- Disable cursor line.
vim.opt.cursorline = false

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Sudo write in case of permission denied
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", {})

vim.g.netrw_liststyle = 3

-- Disable swap files and enable undo files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"
