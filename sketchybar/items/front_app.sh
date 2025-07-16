#!/bin/bash

COMPONENT=(
  item
  front_app
  left
)

CONFIG=(
  script="$PLUGIN_DIR/front_app.sh"
  icon.drawing=off
  label.font.style=Bold
)

SUBSCRIBE=(
  front_app_switched
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"


