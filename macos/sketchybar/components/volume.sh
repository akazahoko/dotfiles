#!/bin/bash

NAME="volume"
POSITION="right"

# first launch
INIT_VOLUME=$()
    
case "$VOLUME" in
    [6-9][0-9] | 100) ICON="􀊩";;
    [3-5][0-9]) ICON="􀊧";;
    [1-9] | [1-2][0-9]) ICON="􀊥";;
    *) ICON="􀊣";;
esac

PROPERTIES=(
    icon="$ICON"
    label="$VOLUME"
    script="$CONFIG_DIR/scripts/$NAME.sh"
)

SUBSCRIBE=(
    volume_change
)

sketchybar  --add item "$NAME" "$POSITION" \
            --set "$NAME" "${PROPERTIES[@]}" \
            --subscribe "$NAME" "${SUBSCRIBE[@]}" 