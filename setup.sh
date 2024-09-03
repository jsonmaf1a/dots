#!/bin/bash

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        for i in $(seq 0 3); do
            printf "\r[%c] Working..." "${spinstr:$i:1}"
            sleep $delay
        done
    done
    printf "\r%s\n" "Done!         "
}

PROFILE_DIR=~/.mozilla/firefox

if [ -d "$PROFILE_DIR" ]; then
  PROFILE_INI="$PROFILE_DIR/profiles.ini"
  
  if [ -f "$PROFILE_INI" ]; then
    DEFAULT_PROFILE=$(grep -m1 'Default=' "$PROFILE_INI" | cut -d'=' -f2)
    
    if [ -n "$DEFAULT_PROFILE" ]; then
      FIREFOX_PROFILE_PATH="$PROFILE_DIR/$DEFAULT_PROFILE"
    fi
  fi
fi

time=$(date '+%N')
(
    mkdir ~/dots-backup-$time/
    cp ~/.zshrc ~/dots-backup-$time/
    cp ~/.zshenv ~/dots-backup-$time/
    cp -r ~/.config/ ~/dots-backup-$time/
    cp -r ~/.mozilla/firefox/ ~/dots-backup-$time/
) &
backup_pid=$!

spinner $backup_pid

ln -s $(realpath .zshrc) ~/.zshrc
ln -s $(realpath .zshenv) ~/.zshenv
ln -s $(realpath ./.config/eww) ~/.config/eww
ln -s $(realpath ./.config/helix) ~/.config/helix
ln -s $(realpath ./.config/hypr) ~/.config/hypr
ln -s $(realpath ./.config/noti) ~/.config/noti
ln -s $(realpath ./.config/nvim) ~/.config/nvim
ln -s $(realpath ./.config/rofi) ~/.config/rofi
ln -s $(realpath ./.config/waybar) ~/.config/waybar
ln -s $(realpath ./.config/wezterm) ~/.config/wezterm
ln -s $(realpath ./.config/systemd) ~/.config/systemd
ln -s $(realpath ./firefox/) $FIREFOX_PROFILE_PATH/chrome

echo "Created backup in ~/dots-backup-$time"
echo "Successful installation"
