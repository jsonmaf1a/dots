return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			treesitter.setup({
				highlight = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "vv",
						node_incremental = "vv",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				indent = { enable = true },
				autotag = {
					enable = true,
				},
				textobjects = {
					enable = true,
				},

				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"toml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"c",
					"go",
					"rust",
					"cpp",
					"latex",
				},
			})

			parser_config.hurl = {
				install_info = {
					url = "~/git/github.com/kjuulh/tree-sitter-hurl",
					files = { "src/parser.c" },
					branch = "main",
					generate_requires_npm = false,
					requires_generate_from_grammar = false,
				},
				filetype = "hurl",
			}

			vim.filetype.add({
				extension = {
					hurl = "hurl",
				},
			})

			require("ts_context_commentstring").setup({})
		end,
	},
}
