return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"HiPhish/rainbow-delimiters.nvim",
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

			require("ts_context_commentstring").setup({})

			vim.filetype.add({
				extension = {
					hurl = "hurl",
					[".*/hypr/.*%.conf"] = "hyprlang",
				},
			})

			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = "",
				zindex = 20, -- The Z-index of the context window
				on_attach = function()
					vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
				end, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
}
