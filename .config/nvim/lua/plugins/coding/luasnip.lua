return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	build = "make install_jsregexp",
	config = function()
		require("luasnip").config.set_config({
			history = true,
			ext_base_prio = 200,
			ext_prio_increase = 1,
			enable_autosnippets = false,
		})
	end,
}
