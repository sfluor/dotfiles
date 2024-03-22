vim.g['test#strategy'] = "neovim_sticky"


vim.api.nvim_buf_set_keymap(0, "n", "<leader>tf", ":TestFile<CR>", { desc = '[T]est [F]ile' })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>tn", ":TestNearest<CR>", { desc = '[T]est [N]earest' })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>tl", ":TestLast<CR>", { desc = '[T]est [L]ast' })
