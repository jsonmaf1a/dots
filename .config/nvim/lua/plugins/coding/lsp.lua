return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"folke/neodev.nvim",
			"folke/neoconf.nvim",
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- "hrsh7th/cmp-nvim-lsp",
		},
		servers = nil,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		ft = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		config = true,
	},
	{
		"dmmulroy/tsc.nvim",
		cmd = { "TSC" },
		config = true,
	},
}
