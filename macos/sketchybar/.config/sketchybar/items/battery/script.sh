#!/bin/bash

source $CONFIG_DIR/variables.sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
IS_LOW="$(pmset -g | grep 'lowpowermode')"

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

case "${PERCENTAGE}" in
    9[0-9] | 100) ICON="" COLOR=$ICON_COLOR;;
    [6-8][0-9]) ICON="" COLOR=$ICON_COLOR;;
    [3-5][0-9]) ICON="" COLOR=$ICON_COLOR;;
    [1-2][0-9]) ICON="" COLOR=$ICON_COLOR;;
    *) ICON="" ;;
esac

if [[ "$CHARGING" != "" ]]; then
    ICON="" 
    COLOR=0xffa6e3a1
fi

if [ "$IS_LOW" = " lowpowermode         1" ]; then
    COLOR=0xffffcc00
fi

PROPERTIES=(
    icon="${ICON}"
    icon.color="${COLOR}"
    label="${PERCENTAGE}%"
    label.color="$COLOR"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
