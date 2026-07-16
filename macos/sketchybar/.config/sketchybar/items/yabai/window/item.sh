#!/bin/bash

NAME="window"
POSITION="left"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/$NAME.sh"
)

SUBSCRIBE=(
    front_app_switched
    rift_window_focused
    title_changed
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 