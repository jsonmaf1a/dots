local colors = require("ui.assets").colors

-- local bg = "#16161E" -- TODO: use ui.assets.colors instead of plain value
local bg = "#1A1B26" -- TODO: use ui.assets.colors instead of plain value

local highlights = {
	fill = {
		bg = bg,
	},
	background = {
		bg = bg,
	},
	buffer_visible = {
		bg = bg,
	},
	buffer_selected = {
		-- bg = bg,
		-- fg = colors.violet,
	},
	separator_selected = {
		fg = bg,
	},
	separator_visible = {
		fg = bg,
		bg = bg,
	},
	separator = {
		fg = bg,
		bg = bg,
	},
	indicator_visible = {
		bg = bg,
		fg = bg,
	},
	indicator_selected = {
		bg = bg,
		fg = bg,
	},
	modified = {
		bg = bg,
	},
	modified_visible = {
		bg = bg,
	},
	modified_selected = {
		bg = bg,
	},
	offset_separator = {
		bg = bg,
		-- fg = bg,
	},
}

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		-- after = "catppuccin",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset.slate,
					themable = true,
					-- show_buffer_icons = false,
					show_buffer_close_icons = false,
					-- show_close_icon = false,
					show_tab_indicators = false,
					-- modified_icon = "󰨐",
					separator_style = "slant", -- { "", "" },
					indicator = {
						style = "none",
					},
					offsets = {
						{
							filetype = "neo-tree",
							text = "Explorer",
							highlight = "FileExplorer",
							separator = true,
						},
					},
				},
				highlights = highlights,
			})
		end,
	},
}
