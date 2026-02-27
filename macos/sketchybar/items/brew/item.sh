#!/bin/bash

NAME="brew"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/$NAME.sh"
)

SUBSCRIBE=(
    is_unlock
    mouse.clicked
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 