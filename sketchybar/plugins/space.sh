#!/bin/bash

source "$CONFIG_DIR/colors.sh"

SPACE_ID=$(echo $NAME | cut -c 7-)
APP_LABEL=()
IFS=$'\n'

if [ "$SENDER" = "space_windows_change" ] || [ "$SENDER" = "space_change" ]; then
  APP_ARR=($(yabai -m query --windows --space $SPACE_ID | jq '.[].app' | sort -u | sed s'#"##'g))
  for i in "${!APP_ARR[@]}"; do
    APP_LABEL+=("$($CONFIG_DIR/plugins/app_map_fn.sh ${APP_ARR[i]}) ")
  done
fi

# $($CONFIG_DIR/plugins/icon_map_fn.sh ${APP_ARR[i]})

CONFIG=(
  background.height=30
  background.drawing=off
  # background.color="$ACCENT_COLOR"
  # background.drawing="$SELECTED"
  label="${APP_LABEL[@]}"
)

sketchybar --set "$NAME" "${CONFIG[@]}"
