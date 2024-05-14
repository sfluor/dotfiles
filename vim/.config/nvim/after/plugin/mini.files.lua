require("mini.files").setup()

vim.keymap.set('n', '<leader>e', function() MiniFiles.open(vim.fn.expand('%:p:h')) end, { desc = "open Local [E]xplorer" })
vim.keymap.set('n', '<leader>E', MiniFiles.open, { desc = "open Global [E]xplorer" })
