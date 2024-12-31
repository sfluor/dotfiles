local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
        layout_strategy = "flex",
        layout_config = {
            flip_columns = 180
        },
        path_display = { "truncate", "smart" },
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
vim.keymap.set("n", "gb", require('telescope.builtin').buffers, { desc = '[B]uffers search' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = '[P]roject Files' })
vim.keymap.set('n', 'gp', require('telescope.builtin').git_files, { desc = '[P]roject Files' })
vim.keymap.set('n', 'gsf', require('telescope.builtin').find_files, { desc = 'Search for [F]iles' })
vim.keymap.set('n', 'gsb', require('telescope.builtin').current_buffer_fuzzy_find,
    { desc = '[S]earch in [B]uffer' })
vim.keymap.set('n', 'gh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', 'gsw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', 'gf', require('telescope.builtin').live_grep, { desc = 'Search in [F]iles' })
vim.keymap.set('n', 'gsd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', 'gst', '<Cmd>Telescope<CR>', { desc = '[S]earch [T]elescope' })
