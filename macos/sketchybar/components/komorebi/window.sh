#!/bin/bash

NAME="window"
POSITION="left"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/komorebi/$NAME.sh"
)

SUBSCRIBE=(
    front_app_switched
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 