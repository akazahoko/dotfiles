#!/bin/bash

COMPONENT=(
    item
    front_app
    left
)

CONFIG=(
    script="$PLUGIN_DIR/front_app.sh"
    label.font.style=Bold
    label.padding_left=5
    label.padding_right=5
    background.drawing=off
)

SUBSCRIBE=(
    front_app_switched
)

NAME="${COMPONENT[1]}"

sketchybar  --add       "${COMPONENT[@]}"           \
	        --set       "${NAME}" "${CONFIG[@]}"    \
	        --subscribe "${NAME}" "${SUBSCRIBE[@]}"