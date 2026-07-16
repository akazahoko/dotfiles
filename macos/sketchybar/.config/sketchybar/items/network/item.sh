#!/bin/bash

NAME="network"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/items/$NAME/script.sh"
    click_script="open "x-apple.systempreferences:com.apple.preference.wifi""
)

SUBSCRIBE=(
    wifi_change
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 