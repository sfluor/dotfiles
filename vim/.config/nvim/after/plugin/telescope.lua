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
vim.keymap.set("n", "<leader>b", require('telescope.builtin').buffers, { desc = '[B]uffers search' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = '[P]roject Files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>T', '<Cmd>Telescope<CR>', { desc = '[T]elescope' })


-- LSP mappings
local mason_lspconfig = require('mason-lspconfig')

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local lspmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    lspmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    lspmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    lspmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    lspmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    lspmap('<C-s>', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
})
