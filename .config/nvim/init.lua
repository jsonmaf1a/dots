CONFIG = {
	showmode = false, --- e.g. -- INSERT --
	enable_mouse = true,
	transparency = true,
	cursorline = false,
	global_statusline = false,
	virtual_text = true,
	relative_number = false,
	hide_cmdline = false,
	colorscheme = {
		dark = "tokyonight-night",
		light = "catppuccin-latte",
	},
}

require("core")
require("lsp")
require("ui")
