local M = {}

M.settings = {
	Lua = {
		completion = {
			callSnippet = "Both",
		},
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = {
				vim.fn.expand("$VIMRUNTIME/lua"),
				vim.fn.stdpath("config") .. "/lua",
			},
		},
	},
}

return M
