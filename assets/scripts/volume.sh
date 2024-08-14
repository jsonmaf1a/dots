#!/bin/bash
VOL_UP=$ICONS/volup.svg
VOL_DOWN=$ICONS/voldown.svg
VOL_MUTE=$ICONS/volmute.svg

URGENCY=low
APP_NAME=volume
ID=9999

case $1 in
up)
	pamixer -i 5 -u
	noti send -a $APP_NAME -u $URGENCY -i $VOL_UP -r $ID "Volume: $(pamixer --get-volume)%"
	;;
down)
	pamixer -d 5 -u
  noti send -a $APP_NAME -u $URGENCY -i $VOL_DOWN -r $ID "Volume: $(pamixer --get-volume)%"
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		noti send -a $APP_NAME -u "critical" -i $VOL_MUTE -r $ID "Volume muted"
	else
		noti send -a $APP_NAME -u "critical" -i $VOL_UP -r $ID "Volume unmuted"
	fi
	;;
esac
