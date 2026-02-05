#!/bin/bash

NAME="clock"
POSITION="right"

PROPERTIES=(
    icon.drawing=off
    script=$CONFIG_DIR/scripts/clock.sh
    click_script="open -a calendar"
    update_freq=30
)

SUBSCRIBE=(
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 