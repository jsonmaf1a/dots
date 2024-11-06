return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"microsoft/vscode-js-debug",
			"mxsdev/nvim-dap-vscode-js",
			"williamboman/mason.nvim",
		},
		config = function()
			require("plugins.coding.dap.config.js")
			require("plugins.coding.dap.config.rust")
		end,
	},
}
