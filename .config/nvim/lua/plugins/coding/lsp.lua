return {
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		"folke/neoconf.nvim",
	-- 		"mason.nvim",
	-- 		"williamboman/mason-lspconfig.nvim",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 	},
	-- 	servers = nil,
	-- },
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	dependencies = {
	-- 		-- "williamboman/mason-lspconfig.nvim",
	-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("mason").setup({
	-- 			ui = {
	-- 				icons = {
	-- 					package_installed = "◍",
	-- 					package_pending = "◍",
	-- 					package_uninstalled = "◍",
	-- 				},
	-- 				border = CONFIG.border,
	-- 			},
	-- 		})
	--
	-- 		-- require("mason-lspconfig").setup({
	-- 		-- 	ensure_installed = {
	-- 		-- 		"bashls",
	-- 		-- 		"cssls",
	-- 		-- 		"graphql",
	-- 		-- 		"html",
	-- 		-- 		"jsonls",
	-- 		-- 		"lua_ls",
	-- 		-- 		"prismals",
	-- 		-- 		"tailwindcss",
	-- 		-- 		"emmet_ls",
	-- 		-- 		"biome",
	-- 		-- 		"clangd",
	-- 		-- 		"gopls",
	-- 		-- 		"rust_analyzer",
	-- 		-- 		"pyright",
	-- 		-- 		"kotlin_language_server",
	-- 		-- 	},
	-- 		-- 	automatic_installation = true,
	-- 		-- })
	-- 	end,
	-- },
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = function()
			require("template-string").setup()
		end,
	},
}
