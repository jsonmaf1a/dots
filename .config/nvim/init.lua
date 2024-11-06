CONFIG = {
	showmode = false, --- e.g. -- INSERT --
	enable_mouse = true,
	transparency = false,
	cursorline = false,
	global_statusline = false,
	virtual_text = false,
	relative_number = false,
	hide_cmdline = false,
	colorscheme = {
		dark = "onedark",
		light = "catppuccin-latte",
	},
}

require("core")
require("lsp")
require("ui")
