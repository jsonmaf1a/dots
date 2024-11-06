local border = require("ui.assets").border

return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {},
	config = function()
		require("typescript-tools").setup({
			on_attach = function(client, bufnr)
				if vim.fn.has("nvim-0.10") then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
			handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					silent = true,
					border = border or "rounded",
				}),
				["textDocument/signatureHelp"] = vim.lsp.with(
					vim.lsp.handlers.signature_help,
					{ border = border or "rounded" }
				),
				["textDocument/publishDiagnostics"] = vim.lsp.with(
					vim.lsp.diagnostic.on_publish_diagnostics,
					{ virtual_text = CONFIG.virtual_text }
				),
			},

			settings = {
				separate_diagnostic_server = false,
				code_lens = "off",
				tsserver_file_preferences = {
					includeInlayParameterNameHints = "all",
					includeCompletionsForModuleExports = true,
					quotePreference = "auto",
				},
				jsx_close_tag = {
					enable = true,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
	end,
}
