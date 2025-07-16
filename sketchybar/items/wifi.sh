#!/bin/bash

COMPONENT=(
  item
  wifi
  right
)

CONFIG=(
  update_freq=120
  script="$PLUGIN_DIR/wifi.sh"
  # click_script="open "x-apple.systempreferences:com.apple.preference.wifi""
  # background.drawing=off
  # icon.padding_rigft=0
  # label.padding_left=0
  # label.drawing=off
)

SUBSCRIBE=(
  wifi_change
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"
