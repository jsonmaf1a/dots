local lspconfig = require("lspconfig")
local lspui_ok, lspui = pcall(require, "lspconfig.ui.windows")
local border = require("ui.assets").border

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		silent = true,
		border = border or "rounded",
	}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border or "rounded" }),
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ virtual_text = CONFIG.virtual_text }
	),
}

local function on_attach(client, bufnr)
	-- set up buffer keymaps, etc.
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true)
	end
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,
		})
	end,

	["ts_ls"] = function()
		-- Skip since we use typescript-tools.nvim
	end,

	["tailwindcss"] = function()
		lspconfig.tailwindcss.setup({
			capabilities = require("lsp.servers.tailwindcss").capabilities,
			filetypes = require("lsp.servers.tailwindcss").filetypes,
			handlers = handlers,
			on_attach = require("lsp.servers.tailwindcss").on_attach,
			settings = require("lsp.servers.tailwindcss").settings,
		})
	end,

	["cssls"] = function()
		lspconfig.cssls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = require("lsp.servers.cssls").on_attach,
			settings = require("lsp.servers.cssls").settings,
		})
	end,

	["jsonls"] = function()
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("lsp.servers.jsonls").settings,
		})
	end,

	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			settings = require("lsp.servers.lua_ls").settings,
		})
	end,
})

-- UI

if not lspui_ok then
	return
end

lspui.default_options.border = border
vim.diagnostic.config({
	float = { border = "rounded" },
})
