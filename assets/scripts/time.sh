#!/bin/bash

total_seconds=$1

hours=$((total_seconds / 3600))
minutes=$(((total_seconds % 3600) / 60))
seconds=$((total_seconds % 60))

output=""
if [ $hours -gt 0 ]; then
    output="${hours} hour"
    if [ $hours -gt 1 ]; then
        output+="s"
    fi
    if [ $minutes -gt 0 ]; then
        output+=" ${minutes} minute"
        if [ $minutes -gt 1 ]; then
            output+="s"
        fi
    fi
elif [ $minutes -gt 0 ]; then
    output="${minutes} minute"
    if [ $minutes -gt 1 ]; then output+="s"
    fi
    if [ $seconds -gt 0 ]; then
        output+=" ${seconds} second"
        if [ $seconds -gt 1 ]; then
            output+="s"
        fi
    fi
else
    output="${seconds} second"
    if [ $seconds -gt 1 ]; then
        output+="s"
    fi
fi

echo "$output"
