#!/bin/bash

if [[ $1 == "charging" ]]; then
  noti send "Battery status: charging" -a "Battery" -r 5
  exit 0;
fi
if [[ $1 == "discharging" ]]; then
  noti send "Battery status: discharging" -a "Battery" -r 5
  exit 0;
fi

ICON=$ICONS/batlow.svg
BATTERY=$(busctl call --json=pretty org.freedesktop.UPower /org/freedesktop/UPower/devices/battery_BAT0 org.freedesktop.DBus.Properties GetAll s 'org.freedesktop.UPower.Device' | jq '.data[].Percentage.data|round')

REMAINING_SECONDS=$(busctl call --json=pretty org.freedesktop.UPower /org/freedesktop/UPower/devices/battery_BAT0 org.freedesktop.DBus.Properties GetAll s 'org.freedesktop.UPower.Device' | jq '.data[].TimeToEmpty.data|round')
REMAINING=$($SCRIPTS/time.sh $REMAINING_SECONDS)

if [[ $BATTERY -lt 20 ]]; then
  noti send -t 0 -i $ICON "Battery level: $BATTERY%" "<b>Remaining:</b> $REMAINING" -a "LowBattery" -r 4
fi
