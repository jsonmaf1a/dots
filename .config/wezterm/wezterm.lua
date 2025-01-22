local wezterm = require("wezterm")
local utils = require("config.utils")
local tabs = require("config.tabs")
local keybindings = require("config.keybindings")

local config = wezterm.config_builder()

local function get_theme(appearance)
	if appearance:find("Dark") then
		return {
			-- theme = "OneDark (base16)",
			theme = "tokyonight_night",
			cursor = "Bibata-Modern-Classic",
		}
	else
		return {
			theme = "Catppuccin Latte",
			cursor = "Bibata-Modern-Ice",
		}
	end
end

local colorscheme = get_theme(utils.get_appearance())

config.colors = {} --  WARNING: dont touch this, use utils.merge_tables
config.window_frame = {} --  WARNING: dont touch this, use utils.merge_tables

config.color_scheme = colorscheme.theme
config.xcursor_theme = colorscheme.cursor
config.font = wezterm.font("JetBrainsMono Nerd Font") --  TEST: => -> >= 1 2 3 4 5 6 7 8 9 0
config.font_size = 14
config.check_for_updates = false
config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 1
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.3,
}

keybindings.apply(config)
tabs.apply(config)

return config
