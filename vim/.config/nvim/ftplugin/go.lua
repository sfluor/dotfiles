local gotestquery = vim.treesitter.query.parse_query("go", [[
(function_declaration
  name: (identifier) @funcname (#match? @funcname "(Test|Benchmark).*")
  parameters: (parameter_list
                (
                 parameter_declaration
                    name: (identifier) @param
                 ) (#match? @param "(t|b)")
                )
  )]])

-- reuse the same buffer for tests.
local testbuffer = vim.api.nvim_create_buf(false, true)

function RunTest(command)
    print("Running tests: " .. command)
    local job = vim.fn.jobstart(
        command,
        {
            on_exit = function()
                print("-- done running " .. command .. " in buffer:" .. testbuffer)
                vim.cmd("bot 10split")
                vim.api.nvim_set_current_buf(testbuffer)
            end,
            on_stdout = function(jobid, data, event)
                print("Test result: ")
                vim.api.nvim_buf_set_lines(testbuffer, 0, 0, true, data)
            end,
            on_stderr = function(jobid, data, event)
                print("Couldn't run test: ")
                vim.api.nvim_buf_set_lines(testbuffer, 0, 0, true, data)
            end
        }
    )
end

function RunGoTest(testname)
    local dir = vim.fn.expand("%:h") .. '/...'

    local nameparam = ""
    if testname ~= nil then
        nameparam = "-run=^" .. testname .. "$ "
    end

    local command = "go test -v " .. nameparam .. "./" .. dir
    RunTest(command)
end

function RunCurrentGoTests()
    local bufnr = 0 -- current buffer
    local parser = vim.treesitter.get_parser(bufnr, "go")
    local root = parser:parse()[1]:root()
    local row, col = unpack(vim.api.nvim_win_get_cursor(bufnr))

    for id, node in gotestquery:iter_captures(root, bufnr, 0, -1) do
        local name = gotestquery.captures[id]
        if name == "funcname" then
            local start_row, _, end_row, _ = vim.treesitter.get_node_range(node:parent())
            -- row starts at 0 for this helper.
            if vim.treesitter.node_contains(node:parent(), { row - 1, col, row - 1, col }) then
                local testname = vim.treesitter.get_node_text(node, bufnr)
                RunGoTest(testname)
                return
            end
        end
    end

    RunGoTest()
end

vim.keymap.set("n", "<leader>t", RunCurrentGoTests, { desc = 'Run [T]ests' })
