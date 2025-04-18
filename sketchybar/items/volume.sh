#!/bin/bash

COMPONENT=(
  item
  volume
  right
)

CONFIG=(
  script="$PLUGIN_DIR/volume.sh"
  background.drawing=off
)

SUBSCRIBE=(
  volume_change
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"
