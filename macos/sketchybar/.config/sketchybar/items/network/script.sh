#!/bin/bash

source $CONFIG_DIR/variables.sh

SSID="$(
    ipconfig getsummary en0 | \
    awk -F ' SSID : '  '/ SSID : / {print $2}'
)"

if [[ "$SSID" == "" ]]; then
    ICON="􀙈"
    COLOR=$ALERT_COLOR
else
    ICON="󰖩"
    COLOR=$ICON_COLOR
fi

PROPERTIES=(
    icon="$ICON"
    icon.color="$COLOR"
    label=$SSID
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
