local dap = require("dap")
local dapui = require("dapui")


-- Recommended to get type checking for APIs
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

vim.keymap.set("n", "<leader>dbs", dapui.setup, { desc = '[D]e[b]ug setup' })
vim.keymap.set("n", "<leader>dbb", dap.toggle_breakpoint, { desc = '[D]e[b]ug [B]reakpoint' })
vim.keymap.set("n", "<leader>dbc", dap.continue, { desc = '[D]e[b]ug [C]ontinue / Start' })
vim.keymap.set("n", "<leader>dbo", dap.step_over, { desc = '[D]e[b]ug Step [O]ver' })
vim.keymap.set("n", "<leader>dbi", dap.step_over, { desc = '[D]e[b]ug Step [I]nto' })
