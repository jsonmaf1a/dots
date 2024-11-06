return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "modern",
		plugins = { spelling = true, marks = false, registers = true },
		-- motions = { count = false, }, icons = {
		icons = {
			breadcrumb = ">",
			separator = "➜", --
			group = "$",
			rules = false,
		},
		spec = {
			{ "<leader>u", group = "ui" },
			{ "<leader>d", group = "debug" },
			{ "<leader>f", group = "find" },
			{ "<leader>c", group = "code" },
			{ "<leader>x", group = "diagnostics" },
			-- { "<leader>b", group = "buffers" },
			{ "<leader>g", group = "git" },
			{ "<leader>M", group = "misc" },
		},
		win = {
			title = false,
			border = "rounded",
			zindex = 1000,
			wo = {
				winblend = 0,
			},
			padding = { 1, 2, 1, 2 },
			no_overlap = true,
		},
		layout = {
			height = { min = 4 },
			spacing = 3,
			align = "center",
		},

		show_help = false,
		show_keys = false,
	},
}
