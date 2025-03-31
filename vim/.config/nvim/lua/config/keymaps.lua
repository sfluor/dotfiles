-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- lua/config/keymaps.lua

local map = vim.keymap.set

-- Center after goto search result
map("n", "n", "nzz", { desc = "Next search result and center" })
map("n", "N", "Nzz", { desc = "Previous search result and center" })
map("n", "*", "*zz", { desc = "Search word under cursor and center" })
map("n", "#", "#zz", { desc = "Search backward word under cursor and center" })
map("n", "g*", "g*zz", { desc = "Search partial word forward and center" })
map("n", "g#", "g#zz", { desc = "Search partial word backward and center" })
map("n", "gj", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "gk", "<C-u>zz", { desc = "Scroll up and center" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- -- Custom actions
-- map("n", "ge", ":action GotoNextError<CR>", { desc = "Goto next error" })
-- map("n", "ga", ":action ShowIntentionActions<CR>", { desc = "Show intention actions" })
-- map("n", "gl", ":action ShowErrorDescription<CR>", { desc = "Show error description" })
--
-- Rename and run actions
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename element" })
-- map("n", "<leader>tn", ":action RunContextGroup<CR>", { desc = "Run context group" })
-- map("n", "<leader>tr", ":action Rerun<CR>", { desc = "Rerun last action" })
--
-- -- Terminal activation
-- map("n", "<leader>at", ":action ActivateTerminalToolWindow<CR>", { desc = "Activate terminal tool window" })
