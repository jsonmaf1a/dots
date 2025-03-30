vim.lsp.config.lua = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			completion = {
				callSnippet = "Both",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					-- vim.env.VIMRUNTIME,
					vim.fn.stdpath("config") .. "/lua",
					"${3rd}/luv/library",
				},
			},
		},
	},
}

vim.lsp.enable("lua")
