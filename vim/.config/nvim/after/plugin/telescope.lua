local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
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
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').grep_string, { desc = '[S]earch [C]urrent word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })


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
