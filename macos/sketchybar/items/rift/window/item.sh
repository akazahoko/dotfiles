#!/bin/bash

NAME="window"
POSITION="left"

PROPERTIES=(
    width=40
    script="$CONFIG_DIR/items/rift/$NAME/script.sh"
)

SUBSCRIBE=(
    front_app_switched
    rift_workspace_changed
    rift_window_title_changed
    rift_windows_changed
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 