local common = require("core.lsp.common")

vim.lsp.config.luals = {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	handlers = common.handlers,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
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
	},
}

vim.lsp.enable("luals")
