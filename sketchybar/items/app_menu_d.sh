#!/bin/bash

COMPONENT=(
  item
  app_menu
  left
)

CONFIG=(
  update_freq=120
  script="$PLUGIN_DIR/app_menu.sh"
  # background.drawing=off
  # icon.padding_rigft=0
  # label.padding_left=0
  label.drawing=off
)

SUBSCRIBE=(
  power_source_change
)

NAME="${COMPONENT[1]}"

# sketchybar  --add "${COMPONENT[@]}" \
            # --set "${NAME}" "${CONFIG[@]}" \
            # --subscribe "${NAME}" "${SUBSCRIBE[@]}"

sketchybar  --add alias "Shottr" left