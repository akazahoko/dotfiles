#!/bin/bash

NAME="volume"
POSITION="right"

PROPERTIES=(
    icon.width=24
    script="$CONFIG_DIR/items/$NAME/script.sh"
)

SUBSCRIBE=(
    volume_change
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 