return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			typescript = { "oxlint", "biomejs" },
			javascript = { "oxlint", "biomejs" },
			typescriptreact = { "oxlint", "biomejs" },
			javascriptreact = { "oxlint", "biomejs" },
		}
	end,
}
