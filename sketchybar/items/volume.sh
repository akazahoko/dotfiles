#!/bin/bash

COMPONENT=(
  item
  volume
  right
)

CONFIG=(
  script="$PLUGIN_DIR/volume.sh"
  # click_script="sketchybar --set \$NAME popup.drawing=toggle"
  popup.align=center
  popup.background.corner_radius=10
  popup.background.blur_radius=50
  popup.background.color=0xd02e2e2e
  popup.background.border_width=1
  popup.background.border_color=0x50ffffff
  popup.background.shadow=on
)

SUBSCRIBE=(
  volume_change
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"

source "$ITEM_DIR/volume_slider.sh"