return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		source_selector = {
			winbar = false, -- toggle to show selector on winbar
			statusline = false, -- toggle to show selector on statusline
			show_scrolled_off_parent_node = false, -- boolean
			sources = { -- table
				{
					source = "filesystem", -- string
					display_name = " 󰉓 Files ", -- string | nil
				},
				{
					source = "buffers", -- string
					display_name = " 󰈚 Buffers ", -- string | nil
				},
				{
					source = "git_status", -- string
					display_name = " 󰊢 Git ", -- string | nil
				},
			},
			content_layout = "start", -- string
			tabs_layout = "equal", -- string
			truncation_character = "…", -- string
			tabs_min_width = nil, -- int | nil
			tabs_max_width = nil, -- int | nil
			padding = 0, -- int | { left: int, right: int }
			separator = {
				left = "",
				right = "",
			}, -- string | { left: string, right: string, override: string | nil }
			separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
			show_separator_on_edge = false, -- boolean
			highlight_tab = "NeoTreeTabInactive", -- string
			highlight_tab_active = "NeoTreeTabActive", -- string
			highlight_background = "NeoTreeTabInactive", -- string
			highlight_separator = "NeoTreeTabSeparatorInactive", -- string
			highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = {
				enabled = true,
				update_root = true,
				update_cwd = true,
				ignore_list = {
					"dap-repl",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dapui_console",
				},
			},
			use_libuv_file_watcher = true,
			hijack_netrw_behavior = "open_current",

			filtered_items = {
				hide_by_name = {
					".DS_Store",
					"thumbs.db",
					"node_modules",
					"pnpm-lock.yaml",
					"package-lock.json",
				},
			},
		},
		enable_git_status = true,
		default_component_configs = {
			git_status = {
				symbols = {
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
				},
			},
			modified = {
				symbol = "+",
				highlight = "NeoTreeAdded",
			},
		},
		window = {
			position = "left",
			width = 30,
			mappings = {
				["<tab>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
