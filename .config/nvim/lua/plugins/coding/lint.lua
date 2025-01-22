return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			typescript = { "biomejs" },
			javascript = { "biomejs" },
			typescriptreact = { "biomejs" },
			javascriptreact = { "biomejs" },
		}
	end,
}
