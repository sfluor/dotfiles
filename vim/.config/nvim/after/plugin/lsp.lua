local lsp = require('lsp-zero')
lsp.preset('recommended')


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

    -- Quick rename
    lspmap("<C-s>", require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')
    lspmap("<leader>R", vim.lsp.buf.rename, "[R]ename")
    lspmap("<leader>ds", require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    lspmap("gd", vim.lsp.buf.type_definition, '[Goto] type [D]efinition')
    lspmap("gI", vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    lspmap("ge", vim.diagnostic.goto_next, "[G]o to next [E]rror")
    lspmap("gl", vim.diagnostic.open_float, "Open diagnostic [L]ogs")
    lspmap("gr", require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
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

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Auto format on save from: https://www.jvt.me/posts/2022/03/01/neovim-format-on-save/
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Setup LSP status in the status line
-- require("fidget").setup({})
