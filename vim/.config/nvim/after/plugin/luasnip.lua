local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

-- Jump to next / previous
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent = true})
