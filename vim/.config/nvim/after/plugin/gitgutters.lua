-- Git gutters
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "GitGutterAdd", { bg = "none", fg = vim.env.GREEN })
vim.api.nvim_set_hl(0, "GitGutterDelete", { bg = "none", fg = vim.env.RED })
vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "none", fg = vim.env.MAGENTA })

-- Update time for git gutters
vim.opt.updatetime = 100
