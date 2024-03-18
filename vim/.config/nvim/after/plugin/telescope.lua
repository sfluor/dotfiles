local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            flip_columns = 180
        },
        file_ignore_patterns = {
            ".git/.*",
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                -- Only require one escape to close telescope
                ['<esc>'] = actions.close,
            },
        },
        color_devicons = true,
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- Mapppings
vim.keymap.set("n", "<leader>b", require('telescope.builtin').buffers, { desc = '[B]uffers search' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = '[P]roject Files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>t', '<Cmd>Telescope<CR>', { desc = '[T]elescope' })


-- Improve colors
local TelescopeColor = {
    TelescopeMatching = { fg = vim.env.RED },
    TelescopeSelection = { fg = vim.env.WHITE, bg = vim.env.BACKGROUND, bold = true },
    TelescopePromptPrefix = { bg = vim.env.GREY },
    TelescopePromptNormal = { bg = vim.env.GREY },
    TelescopeResultsNormal = { bg = vim.env.GREY },
    TelescopePreviewNormal = { bg = vim.env.GREY },
    TelescopePromptBorder = { bg = vim.env.GREY, fg = vim.env.WHITE },
    TelescopeResultsBorder = { bg = vim.env.GREY, fg = vim.env.GREY },
    TelescopePreviewBorder = { bg = vim.env.GREY, fg = vim.env.GREY },
    TelescopePromptTitle = { bg = vim.env.MAGENTA, fg = vim.env.GREY },
    TelescopeResultsTitle = { fg = vim.env.GREY },
    TelescopePreviewTitle = { bg = vim.env.GREEN, fg = vim.env.GREY },
}

for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
end
