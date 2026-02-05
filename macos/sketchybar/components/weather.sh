#!/bin/bash

NAME="weather"
POSITION="right"

PROPERTIES=(
    script="$CONFIG_DIR/scripts/$NAME.sh"
    click_script="open https://www.hko.gov.hk"
    update_freq=3600
)

SUBSCRIBE=(
    is_unlock
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 