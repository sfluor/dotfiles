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
	},
}

vim.g["lightline"] = {
	colorscheme = "env",
	component_function = {
		gitbranch = "fugitive#head",
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

