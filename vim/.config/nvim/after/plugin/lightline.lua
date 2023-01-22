-- Lightline
vim.opt.showmode = false
vim.opt.laststatus = 2
local lightline_cfg = {
	left = {
		{ "mode", "paste" },
		{ "gitbranch", "readonly", "relativepath", "modified" },
	},
	right = {
		{ "lineinfo" },
		{ "percent" },
		{ "filetype" },
		{ "warnings" },
		{ "errors" }
	},
}



function LspDiagnostics(is_error)
	local severity = vim.diagnostic.severity.WARN
	local suffix = " Warning"
	if is_error == 1 then
		suffix = " Error"
		severity = vim.diagnostic.severity.ERROR
	end

	local count = #vim.diagnostic.get(0, { severity = severity })

	if count == 0 then
		return ""
	else
		local plural = ""
		if count > 1 then
			plural = "s"
		end
		return count .. suffix .. plural
	end
end

-- Couldn't find a way to use a lua function in lightline without doing that :(
vim.cmd([[
function! LspErrors()
	return v:lua.LspDiagnostics(1)
endfunction

function! LspWarnings()
	return v:lua.LspDiagnostics(0)
endfunction
]])

vim.g["lightline"] = {
	colorscheme = "env",
	component_expand = {
		gitbranch = "fugitive#Head",
		errors = "LspErrors",
		warnings = "LspWarnings",
	},
	component_type = {
		gitbranch = "info",
		errors = "error",
		warnings = "warning"
	},
	active = lightline_cfg,
	inactive = lightline_cfg,
	mode_map = {
		n = "N",
		i = "I",
		R = "R",
		v = "V",
		V = "L",
		["<C-v>"] = "B",
		c = "C",
		s = "S",
		S = "S-LINE",
		["<C-s>"] = "S-BLOCK",
		t = "T",
	},
}

-- Trigger a refresh every 3 seconds + on write to pickup LSP changes
vim.api.nvim_create_autocmd("BufWritePost", { command = "call lightline#update()" })
