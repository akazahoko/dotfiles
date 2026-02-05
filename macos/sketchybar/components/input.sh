#!/bin/bash

NAME="input"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/$NAME.sh"
    click_script="open "x-apple.systempreferences:com.apple.preference.keyboard""
)

SUBSCRIBE=(
    input_changed
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 