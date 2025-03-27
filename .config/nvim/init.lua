vim.g.CONFIG = {
	showmode = false, --- e.g. -- INSERT --
	enable_mouse = true,
	transparency = false,
	global_statusline = true,
	virtual_text = true,
	relative_number = false,
	indent = 4,
	hide_cmdline = false,
	border = "none",
	colorscheme = {
		-- dark = "tokyonight-night",
		dark = "catppuccin-mocha",
		light = "catppuccin-latte",
	},
}

-- require("utils")
require("core")
-- require("ui")
