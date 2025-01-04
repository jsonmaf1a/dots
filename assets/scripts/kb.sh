#!/bin/sh

ID_TMPFILE=/tmp/kb-noti-id

if [[ ! -f $ID_TMPFILE ]]; then
  touch $ID_TMPFILE
fi

ID=$(<$ID_TMPFILE)

KEYBOARD="at-translated-set-2-keyboard"

# NOTE: kb is https://github.com/JarKz/hyprland_kb_switcher/
# but you can just use `hyprctl switchxkblayout $keyboard next`
kb switch 

VALUE=$(hyprctl devices | grep -i $KEYBOARD -A 2 | tail -n1 | cut -f3,4 -d' ')

if [[ $ID ]]; then 
    noti send -a "kb" -u low -i $ICONS/kb.svg -r $ID "$VALUE"
else
    noti send -a "kb" -u low -i $ICONS/kb.svg "$VALUE" --print-id > $ID_TMPFILE
fi

