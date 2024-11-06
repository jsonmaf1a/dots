local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")

local border = require("ui.assets").border

if not mason_lsp_ok or not mason_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		border = border or "rounded",
	},
})

mason_lsp.setup({
	ensure_installed = {
		"bashls",
		"cssls",
		"graphql",
		"html",
		"jsonls",
		"lua_ls",
		"prismals",
		"tailwindcss",
		"emmet_ls",
		"biome",
		"clangd",
		"gopls",
		"rust_analyzer",
		"pyright",
		"kotlin_language_server",
	},
	automatic_installation = true,
})
