-- Helpers
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

-- Intuitive line moves
nmap("j", "gj")
nmap("k", "gk")

-- Center after goto search result
nmap("n", "nzz")
nmap("N", "Nzz")
nmap("*", "*zz")
nmap("#", "#zz")
nmap("g*", "g*zz")
nmap("g#", "g#zz")

-- Avoid replacing current clipboard when pasting over
map("x", "p", "pgvy")

-- Disable highlights by hitting space
nmap("<space>", ":noh<CR>")

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

-- Explorer
nmap("<leader>x", ":Ex<CR>")

-- Disable arrow keys
for _, key in pairs({ "up", "down", "left", "right" }) do
  nmap("<" .. key .. ">", "<NOP>")
end

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Sudo write in case of permission denied
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", {})
