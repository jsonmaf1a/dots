#!/bin/bash

EVENT=$1
DEVICE=$2

if [ "$EVENT" == "add" ]; then
    MESSAGE="Device added: $DEVICE"
elif [ "$EVENT" == "remove" ]; then
    MESSAGE="Device removed: $DEVICE"
fi

noti send "$MESSAGE" 
