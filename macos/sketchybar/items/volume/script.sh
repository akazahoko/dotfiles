#!/bin/bash

source "$CONFIG_DIR/variables.sh"

if [ "$SENDER" = "volume_change" ]; then
    VOLUME=$INFO
else
    VOLUME=$(osascript -e 'output volume of (get volume settings)')
fi

case "$VOLUME" in
    [6-9][0-9] | 100) ICON="" VOL_COLOR=$ICON_COLOR;;
    [3-5][0-9]) ICON="" VOL_COLOR=$ICON_COLOR;;
    [1-9] | [1-2][0-9]) ICON="" VOL_COLOR=$ICON_COLOR;;
    *) ICON="" VOL_COLOR=$ALERT_COLOR;;
esac

PROPERTIES=(
    # label="$VOLUME"%
    label.drawing=off
    icon="$ICON"
    icon.color="$VOL_COLOR"
    # icon.align=right
    # icon.padding_right="$ICON_PADDING"
    # label.padding_left="$LABEL_PADDING_L"
    # label.padding_right="$LABEL_PADDING_R"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
