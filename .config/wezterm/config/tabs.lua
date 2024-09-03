local M = {}

local wezterm = require("wezterm")
local utils = require("config.utils")
local mode = require("config.colorscheme").theme == "Catppuccin Latte" and "light" or "dark"

local function get_color(dark, light)
  if mode == "dark" then
    return dark
  else
    return light
  end
end

local colors = {
  -- bg = get_color("#151523", "#DBD5D0"),
  -- active = get_color("#232039", "#E9E5E2"),
  -- inactive = get_color("#151526", "#D1CFCE"),
  -- hover = get_color("#202030", "#cdcdcd"),
  -- fg = get_color("#99AEB3", "#898686"),

  bg = "#1d1e21",
  active = "#282C33",
  inactive = "#222326",
  hover = "#444452",
  fg = "#ABB2BF",
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
