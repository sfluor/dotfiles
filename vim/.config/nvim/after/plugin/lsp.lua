local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Quick rename
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
-- Go to next/previous errors
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Auto format on save from: https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
