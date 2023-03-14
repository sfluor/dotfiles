local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Quick rename
vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, { desc = "[R]ename" })
-- Go to next/previous errors
vim.keymap.set("n", "<leader>e", vim.diagnostic.goto_next, { desc = "Go to next [E]rror" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostic [L]ogs" })

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Auto format on save from: https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Setup LSP status in the status line
require("fidget").setup({})
