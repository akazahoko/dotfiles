#!/bin/bash

COMPONENT=(
  item
  IME
  right
)

CONFIG=(
  script="$PLUGIN_DIR/IME.sh"
  icon.drawing=off
)

SUBSCRIBE=(
  IME_change
  mouse.clicked
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"

