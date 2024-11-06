return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			typescript = { "biome" },
			typescriptreact = { "biome" },
			javascript = { "biome" },
			javascriptreact = { "biome" },
			svelte = { "prettierd", "prettier" },
			angular = { "prettierd", "prettier" },
			css = { "biome" },
			html = { "biome" },
			json = { "biome" },
			lua = { "stylua" },
			python = { "black", "isort" },
			graphql = { "prettier", "prettierd" },
			markdown = { "prettier", "prettierd" },
			sql = { "sql-formatter" },
			yaml = { "prettier" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
		format_after_save = {
			lsp_fallback = true,
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end

			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })
		require("conform").setup(opts)
	end,
}
