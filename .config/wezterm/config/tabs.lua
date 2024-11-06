local M = {}

local wezterm = require("wezterm")
local utils = require("config.utils")
local mode = utils.get_appearance():find("Dark") and "dark" or "light"

local function set_color(dark, light)
	if mode == "dark" then
		return dark
	else
		return light
	end
end

local colors = {
	bg = set_color("#1d1e21", "#fff"),
	active = set_color("#282C33", "#E9E5E2"),
	inactive = set_color("#222326", "#D1CFCE"),
	hover = set_color("#444452", "#cdcdcd"),
	fg = set_color("#99AEB3", "#898686"),
}

local window_frame = {
	inactive_titlebar_bg = colors.bg,
	active_titlebar_bg = colors.bg,
	button_fg = colors.fg,
	button_bg = colors.bg,
	button_hover_bg = "#3b3052",
	font_size = 12,
}

local bar_colors = {
	tab_bar = {
		background = colors.bg,
		inactive_tab_edge = colors.active,
		inactive_tab = {
			bg_color = colors.inactive,
			fg_color = colors.fg,
		},
		inactive_tab_hover = {
			bg_color = colors.active,
			fg_color = colors.fg,
		},
		active_tab = {
			bg_color = colors.active,
			fg_color = colors.fg,
		},
	},
}

M.apply = function(config)
	utils.merge_tables(config.colors, bar_colors)
	utils.merge_tables(config.window_frame, window_frame)
end

return M
