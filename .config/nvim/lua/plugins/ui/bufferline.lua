local colors = require("ui.assets").colors

local bg = CONFIG.transparency and "NONE" or colors.bg

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
		bg = bg,
		fg = colors.violet,
	},
	separator_selected = {
		bg = bg,
	},
	separator_visible = {
		bg = bg,
	},
	separator = {
		bg = bg,
	},
	indicator_visible = {
		bg = bg,
	},
	indicator_selected = {
		bg = bg,
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
	},
}

return {
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	-- after = "catppuccin",
	-- 	config = function()
	-- 		local bufferline = require("bufferline")
	-- 		bufferline.setup({
	-- 			options = {
	-- 				-- style_preset = bufferline.style_preset.minimal,
	-- 				-- themable = true,
	-- 				-- show_buffer_icons = false,
	-- 				show_buffer_close_icons = false,
	-- 				-- show_close_icon = false,
	-- 				-- show_tab_indicators = false,
	-- 				modified_icon = "󰨐",
	-- 				separator_style = { "", "" },
	-- 				-- indicator = {
	-- 				-- 	style = "none",
	-- 				-- },
	-- 				offsets = {
	-- 					{
	-- 						filetype = "neo-tree",
	-- 						text = "",
	-- 						highlight = "FileExplorer",
	-- 						separator = true,
	-- 					},
	-- 				},
	-- 			},
	-- 			-- highlights = highlights,
	-- 		})
	-- 	end,
	-- },
}
