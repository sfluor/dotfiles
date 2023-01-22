require("plugins")

vim.cmd("colorscheme base16-snazzy")

-- Helpers
function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
end

-------------------
-- General settings
-------------------

-- Display numbers
vim.opt.number = true

-- Disable column cursor
vim.opt.cursorcolumn = false

-- Keep buffers hidden when not used
vim.opt.hidden = true

-- Intuitive line moves
nmap("j", "gj")
nmap("k", "gk")

-- Use UTF8
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"

-- Enable filetype plugins
-- filetype plugin on
-- filetype indent on
--

-- Update if file is modificated outside vim
vim.opt.autoread = true

-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file
vim.g.mapleader = ","

-- Spaces instead of tabs and be smart with tabs, one tab == 4 spaces
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Autoindent
vim.opt.autoindent = true

-- View replacements dynamically
vim.opt.inccommand = "split"

vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent
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

-- Center after goto search result
nmap("n", "nzz")
nmap("N", "Nzz")
nmap("*", "*zz")
nmap("#", "#zz")
nmap("g*", "g*zz")
nmap("g#", "g#zz")

-- Avoid replacing current clipboard when pasting over
map("x", "p", "pgvy")

-- Line numbers colors
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#78787e", bg = vim.env.BACKGROUND })
vim.api.nvim_set_hl(0, "CursorLine", { bg = vim.env.BACKGROUND })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = vim.env.BLUE, bg = vim.env.BACKGROUND })

vim.api.nvim_set_hl(0, "Normal", { fg = NONE, ctermbg = NONE })

-- Git gutters
vim.api.nvim_set_hl(0, "SignColumn", { bg = NONE, ctermbg = NONE })
vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = NONE, fg = vim.env.GREEN })
vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = NONE, fg = vim.env.RED })
vim.api.nvim_set_hl(0, "GitGutterChange", { bg = NONE, fg = vim.env.MAGENTA })

-------------------
-- Shortcuts
-------------------

-- Disable highlights by hitting space
nmap("<space>", ":noh<CR>")

-- Uppercase current word in insert mode
imap("<C-u>", "<esc>viwUi")

-- Replace last search quickly
nmap("<leader>r", ":%s///gc<left><left><left>")

-- FZF shortcuts
-- Files
nmap("<C-p>", ":call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>")
-- Word under cursor
nmap("<leader>c", ":Ag <c-r><c-w><cr>")
-- Any word
nmap("<leader>a", ":call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>")
-- Any file
nmap("<leader>f", ":call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>")
-- Buffer search
nmap("<leader>b", ":Buffers<CR>")

-- Disable arrow keys
for _, key in pairs({ "up", "down", "left", "right" }) do
	nmap("<" .. key .. ">", "<NOP>")
end

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Sudo write in case of permission denied
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", {})

-------------------
-- Plugins configuration
-------------------

-- Lightline
vim.opt.showmode = false
vim.opt.laststatus = 2
lightline_cfg = {
	left = {
		{ "mode", "paste" },
		{ "gitbranch", "readonly", "relativepath", "modified" },
	},
	right = {
		{ "lineinfo" },
		{ "percent" },
		{ "filetype" },
	},
}

vim.g["lightline"] = {
	colorscheme = "env",
	component_function = {
		gitbranch = "fugitive#head",
	},
	active = lightline_cfg,
	inactive = lightline_cfg,
	mode_map = {
		n = "N",
		i = "I",
		R = "R",
		v = "V",
		V = "L",
		["<C-v>"] = "B",
		c = "C",
		s = "S",
		S = "S-LINE",
		["<C-s>"] = "S-BLOCK",
		t = "T",
	},
}
vim.g.netrw_liststyle = 3

----------------
-- Plugins
----------------

-- Setup LSP
-- -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Auto format on save from: https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Tree sitter
require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all" (the four listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "help", "go", "javascript", "python", "dockerfile", "css", "markdown", "html",
		"zig" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
