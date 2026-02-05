#!/bin/bash

NAME="volume"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/$NAME.sh"
)

SUBSCRIBE=(
    is_unlock
    volume_change
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 