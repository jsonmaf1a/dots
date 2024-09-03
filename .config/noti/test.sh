#!/bin/bash

color=$1

if [ -z "$1" ]; then
  echo "No color provided. Using 'white'"
  echo "Colors: black, white, red, green, blue, yellow, gray, pink"

  color="white"
fi

notify-send -u critical "Test: opaque border critical 1" -a "${color}-border"
notify-send -u normal "Test: opaque border normal 2" -a "${color}-border"
notify-send -u low "Test: opaque border low test 3" -a "${color}-border"
notify-send -u critical "Test: semitransparent border critical 1" -a "${color}-border-semitransparent"
notify-send -u normal "Test: semitransparent border normal 2" -a "${color}-border-semitransparent"
notify-send -u low "Test: semitransparent border low 3" -a "${color}-border-semitransparent"
notify-send -u critical "Test: transparent border critical test 1" -a "${color}-border-transparent"
notify-send -u normal "Test: transparent border normal test 2" -a "${color}-border-transparent"
notify-send -u low "Test: transparent border low test 3" -a "${color}-border-transparent"
