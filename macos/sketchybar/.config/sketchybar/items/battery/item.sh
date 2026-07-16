#!/bin/bash

NAME="battery"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/items/$NAME/script.sh"
    click_script="open "x-apple.systempreferences:com.apple.preference.battery""
    update_freq=120
)

SUBSCRIBE=(
    power_source_change
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 
