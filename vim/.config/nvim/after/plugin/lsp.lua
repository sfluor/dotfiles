local lsp = require('lsp-zero')
lsp.preset('recommended')

local function nmap(shortcut, command)
  vim.api.nvim_set_keymap("n", shortcut, command, { noremap = true, silent = true })
end

-- Quick rename
nmap("<leader>r", ":lua vim.lsp.buf.rename()<CR>")
-- Go to next errors
nmap("<leader>n", ":lua vim.diagnostic.goto_next()<CR>")
nmap("<leader>p", ":lua vim.diagnostic.goto_prev()<CR>")

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Auto format on save from: https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

