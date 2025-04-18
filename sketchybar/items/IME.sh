#!/bin/bash

COMPONENT=(
  item
  IME
  right
)

CONFIG=(
  script="$PLUGIN_DIR/IME.sh"
  background.drawing=off
  icon.padding_left=5
  icon.padding_right=2
  label.padding_left=3
  label.padding_right=5
)

SUBSCRIBE=(
  IME_change
  mouse.clicked
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"

