#!/bin/bash

VOL_UP=$ICONS/volup.svg
VOL_DOWN=$ICONS/voldown.svg
VOL_MUTE=$ICONS/volmute.svg

URGENCY=low
APP_NAME=volume

ID_TMPFILE=/tmp/vol-noti-id

if [[ ! -f $ID_TMPFILE ]]; then
  touch $ID_TMPFILE
fi

ID=$(<$ID_TMPFILE)

send_notification() {
    local icon=$1
    local message=$2
    local urgency=${3:-$URGENCY}

    if [[ $ID ]]; then
        noti send -a "$APP_NAME" -u "$urgency" -i "$icon" -r "$ID" "$message"
    else
        noti send -a "$APP_NAME" -u "$urgency" -i "$icon" "$message" --print-id > "$ID_TMPFILE"
    fi
}

update_volume() {
    local change=$1
    pamixer $change 5 -u
    send_notification "$VOL_UP" "Volume: $(pamixer --get-volume)%"
}

toggle_mute() {
    pamixer -t
    if $(pamixer --get-mute); then
        send_notification "$VOL_MUTE" "Volume muted" "critical"
    else
        send_notification "$VOL_MUTE" "Volume unmuted" "low"
    fi
}

case $1 in
up)
    update_volume "-i"
    ;;
down)
    update_volume "-d"
    ;;
mute)
    toggle_mute
    ;;
*)
    echo "Usage: $0 { 'up' | 'down' | 'mute' }"
    exit 1
    ;;
esac
