#!/bin/bash

NAME="input"
POSITION="right"

PROPERTIES=(
    icon="󰌌"
    label.width=22
    script="$CONFIG_DIR/items/$NAME/script.sh"
    click_script="open "x-apple.systempreferences:com.apple.preference.keyboard""
)

SUBSCRIBE=(
    input_changed
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 