#!/bin/bash

case $1 in
up)
	brightnessctl s +10%
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 1515" | bc -l)
  echo percentage
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
  echo rounded_percentage
	noti send -a "brightness" -u low -i $ICONS/brightness.svg -r 2 "Brightness: $rounded_percentage%"
	;;
down)
	brightnessctl s 10%-
	brightness=$(brightnessctl g)
	percentage=$(echo "scale=0; $brightness * 100 / 1515" | bc -l)
  echo percentage
	rounded_percentage=$(echo "($percentage + 5) / 10 * 10" | bc)
  echo rounded_percentage
	noti send -a "brightness" -u low -i $ICONS/brightness.svg -r 2 "Brightness: $rounded_percentage%"
	;;
esac
