return {
	"chomosuke/typst-preview.nvim",
	lazy = false,
	version = "0.3.*",
	build = function()
		require("typst-preview").update()
	end,
}
