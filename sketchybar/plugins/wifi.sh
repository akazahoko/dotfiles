#!/bin/bash

SSID="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
HOTSPOT_NAME="ap954"

# if [ "$SENDER" = "wifi_change" ] && [ ]; then
  
# fi

if [ "$SSID" = "" ]; then
  ICON="􀙈"
  COLOR=0xff6e6e6e
elif [ "$SSID" = "$HOTSPOT_NAME" ]; then
  ICON="􀉤"
  COLOR=0xffffffff
else 
  ICON="􀙇"
  COLOR=0xffffffff
fi

CONFIG=(
  icon="$ICON"
  icon.color="$COLOR"
  label.drawing=off
  # label="$SSID"
)

sketchybar  --set "$NAME" "${CONFIG[@]}"  \
            --set "$NAME"_POP "${POP_CONFIG[@]}"
