#!/bin/bash

ID_TMPFILE=/tmp/brightness-noti-id

if [[ ! -f $ID_TMPFILE ]]; then
  touch $ID_TMPFILE
fi

ID=$(<$ID_TMPFILE)

send_notification() {
    local value=$1

    if [[ $ID ]]; then 
        noti send -a "brightness" -u low -i $ICONS/brightness.svg -r $ID "Brightness: $value%"
    else
        noti send -a "brightness" -u low -i $ICONS/brightness.svg "Brightness: $value%" --print-id > $ID_TMPFILE
    fi
}

calculate_percentage() {
    local value=$1

	percentage=$(echo "scale=0; $brightness * 100 / 1515" | bc -l)
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)

    echo $rounded_percentage
}

case $1 in
up)
	brightnessctl s +10%
	brightness=$(brightnessctl g)
    send_notification $(calculate_percentage brightness)
	;;
down)
	brightnessctl s 10%-
	brightness=$(brightnessctl g)
    send_notification $(calculate_percentage brightness)
	;;
*)
    echo "Usage: $0 {up|down}"
    exit 1
    ;;
esac
