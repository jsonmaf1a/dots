return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = {
			"css",
			"sass",
			"scss",
			"lua",
			"ts",
			"js",
			"tsx",
			"jsx",
			"html",
			cmp_docs = { always_update = true },
		},
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue or blue
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "virtualtext", -- Set the display mode.
			tailwind = false, -- Enable tailwind colors
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "",
			always_update = false,
		},
	},
}
