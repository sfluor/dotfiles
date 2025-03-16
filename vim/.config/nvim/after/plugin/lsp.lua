local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

--  This function gets run when an LSP connects to a particular buffer.
lsp.on_attach(function(_, bufnr)
    local lspmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    lspmap("gs", require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')
    lspmap("<leader>R", vim.lsp.buf.rename, "[R]ename")
    lspmap("<leader>f", vim.lsp.buf.format, "[F]ormat")
    lspmap("gS", require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
    lspmap("gd", vim.lsp.buf.definition, '[Goto] [D]efinition')
    lspmap("gI", vim.lsp.buf.implementation, '[G]oto [I]mplementation')

    local next = function(severity_lvl)
        return function()
            vim.diagnostic.goto_next({ severity = severity_lvl })
        end
    end
    lspmap("ge", next(vim.diagnostic.severity.ERROR), "[G]o to next [E]rror")
    lspmap("gw", next(vim.diagnostic.severity.WARN), "[G]o to next [W]arning")
    lspmap("gl", vim.diagnostic.open_float, "Open diagnostic [L]ogs")
    lspmap("gr", require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    lspmap("K", vim.lsp.buf.hover, 'Hover signature/documentation')
    lspmap("ga", vim.lsp.buf.code_action, "[Go] to Code [A]ctions")
    lspmap("<leader>f", vim.lsp.buf.format, "[F]ormat code")
end)

vim.filetype.add({ extension = { templ = "templ" } })

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'gopls', 'templ' },
    handlers = {
        lsp.default_setup,
    },
})

lsp.setup()

-- Setup LSP status in the status line
require("fidget").setup({})

-- Enable virtual text diagnostics
vim.diagnostic.config({ virtual_text = true })
