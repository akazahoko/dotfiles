#!/bin/bash

SSID="$(
    ipconfig getsummary en0 | \
    awk -F ' SSID : '  '/ SSID : / {print $2}'
)"

if [[ "$SSID" == "" ]]; then
    ICON="􀙈"
    COLOR=0xff6e6e6e
else
    ICON="􀙇"
    COLOR=0xffffffff
fi

PROPERTIES=(
    icon="$ICON"
    icon.color="$COLOR"
    label.drawing=off
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
