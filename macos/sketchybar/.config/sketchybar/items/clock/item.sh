#!/bin/bash

NAME="clock"
POSITION="right"

PROPERTIES=(
    icon.drawing=off
    script=$CONFIG_DIR/items/$NAME/script.sh
    click_script="open -a calendar"
    update_freq=30
    label.padding_right=10
)

SUBSCRIBE=(
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 