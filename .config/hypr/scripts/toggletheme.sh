#!/bin/bash

ALACRITTY_MAIN_CONFIG="$HOME/.config/alacritty/alacritty.toml"
ALACRITTY_THEME_CURRENT="$HOME/.config/alacritty/theme.toml"
ALACRITTY_THEME_LIGHT="$HOME/.config/alacritty/themes/light.toml"
ALACRITTY_THEME_DARK="$HOME/.config/alacritty/themes/dark.toml"
WAYBAR="$HOME/.config/waybar/style.css"
WAYBAR_BACKGROUND_DARK="@background-dark"
WAYBAR_BACKGROUND_DARK_ALT="@background-dark-alt"
WAYBAR_PRIMARY_DARK="@primary-dark"
WAYBAR_BACKGROUND_LIGHT="@background-light"
WAYBAR_BACKGROUND_LIGHT_ALT="@background-light-alt"
WAYBAR_PRIMARY_LIGHT="@primary-light"
VIMRC="$HOME/.vimrc"
NVIM_THEME_DARK="tokyonight-night"
NVIM_THEME_LIGHT="tokyonight-day"
WALLPAPER_DARK="$HOME/Wallpapers/wallpaper3.jpg"
WALLPAPER_LIGHT="$HOME/Wallpapers/wallpaper2.jpg"
WALLPAPER_TRANSITION_TYPE="--transition-type grow"
WALLPAPER_TRANSITION_FPS="--transition-fps 60"
WALLPAPER_TRANSITION_POS="--transition-pos 0.154,0.176"
WALLPAPER_TRANSITION_STEP="--transition-step 200"
DUNSTRC="$HOME/.config/dunst/dunstrc"
BACKGROUND_DARK='background = "#151C22"'
BACKGROUND_LIGHT='background = "#99AEB3"'
FOREGROUND_DARK='foreground = "#99AEB3"'
FOREGROUND_LIGHT='foreground = "#151C22"'
ICONS="$HOME/.config/dunst/icons"
ICON_DARK="DCDCDC"
ICON_LIGHT="151C22"
current_theme=""

toggle_theme() {
	if cat $ALACRITTY_THEME_CURRENT | grep "dark"; then
		current_theme="dark"
	else
		current_theme="light"
	fi
}

main() {
	toggle_theme
	toggle_wallpaper
	toggle_alacritty_theme
	toggle_waybar_theme
	toggle_nvim_theme
	toggle_icons
	toggle_dunst_theme
}

toggle_waybar_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/${WAYBAR_PRIMARY_LIGHT}/${WAYBAR_PRIMARY_DARK}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_LIGHT}/${WAYBAR_BACKGROUND_DARK}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_LIGHT_ALT}/${WAYBAR_BACKGROUND_DARK_ALT}/gI" $WAYBAR
		reload_waybar
	else
		sed -i "s/${WAYBAR_PRIMARY_DARK}/${WAYBAR_PRIMARY_LIGHT}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_DARK}/${WAYBAR_BACKGROUND_LIGHT}/gI" $WAYBAR
		sed -i "s/${WAYBAR_BACKGROUND_DARK_ALT}/${WAYBAR_BACKGROUND_LIGHT_ALT}/gI" $WAYBAR
		reload_waybar
	fi
}

reload_waybar() {
	killall waybar
	waybar &
}

toggle_nvim_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s/${NVIM_THEME_LIGHT}/${NVIM_THEME_DARK}/gI" $VIMRC
	else
		sed -i "s/${NVIM_THEME_DARK}/${NVIM_THEME_LIGHT}/gI" $VIMRC
	fi

	touch $VIMRC
}

toggle_wallpaper() {
	if [[ $current_theme == "dark" ]]; then
		swww img $WALLPAPER_LIGHT $WALLPAPER_TRANSITION_TYPE
	else
		swww img $WALLPAPER_DARK $WALLPAPER_TRANSITION_TYPE
	fi
}

toggle_alacritty_theme() {
	if [[ $current_theme == "dark" ]]; then
		echo "import = [\"${ALACRITTY_THEME_LIGHT}\"]" >"$ALACRITTY_THEME_CURRENT"
		current_theme="light"
	else
		echo "import = [\"${ALACRITTY_THEME_DARK}\"]" >"$ALACRITTY_THEME_CURRENT"
		current_theme="dark"
	fi

	touch "$ALACRITTY_MAIN_CONFIG"
}

toggle_dunst_theme() {
	if [[ $current_theme == "dark" ]]; then
		sed -i "s|${BACKGROUND_LIGHT}|${BACKGROUND_DARK}|g" "$DUNSTRC"
		sed -i "s|${FOREGROUND_LIGHT}|${FOREGROUND_DARK}|g" "$DUNSTRC"
	else
		sed -i "s|${BACKGROUND_DARK}|${BACKGROUND_LIGHT}|g" "$DUNSTRC"
		sed -i "s|${FOREGROUND_DARK}|${FOREGROUND_LIGHT}|g" "$DUNSTRC"
	fi

	touch $DUNSTRC
	reload_dunst &
	notify
}

toggle_icons() {
	for file in $ICONS/*; do
		echo "Processing file: $file"
		if [[ $current_theme == "dark" ]]; then
			sed -i "s/${ICON_LIGHT}/${ICON_DARK}/g" "$file"
		else
			sed -i "s/${ICON_DARK}/${ICON_LIGHT}/g" "$file"
		fi
		touch "$file"
	done
}

reload_dunst() {
	killall dunst
	dunst
}

notify() {
	dunstify -a "toggleTheme" -u low -i "${ICONS}/${current_theme}.svg" -r 9998 "Switched to ${current_theme}"
}

main
