#!/bin/bash

NAME="window"
POSITION="left"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/rift/$NAME.sh"
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