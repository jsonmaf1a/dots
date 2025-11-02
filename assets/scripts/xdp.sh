#!/bin/bash
sleep 1
killall -e xdg-desktop-portal-hyprland
killall xdg-desktop-portal
touch ~/.cache/xdgh.log
/usr/lib/xdg-desktop-portal-hyprland --verbose >> ~/.cache/xdgh.log &
sleep 2
/usr/lib/xdg-desktop-portal &
