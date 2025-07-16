#!/bin/bash

# SPACE_ID=$(echo $NAME | cut -c 7-)
# APP_LABEL=()
# IFS=$'\n'

# if [ "$SENDER" = "space_windows_change" ] || [ "$SENDER" = "space_change" ]; then
#   APP_ARR=($(yabai -m query --windows --space $SPACE_ID | jq '.[].app' | sort -u | sed s'#"##'g))
#   for i in "${!APP_ARR[@]}"; do
#     APP_LABEL+=("$($CONFIG_DIR/plugins/app_map_fn.sh ${APP_ARR[i]}) ")
#   done
# fi

# $($CONFIG_DIR/plugins/icon_map_fn.sh ${APP_ARR[i]})

# if [ "$SENDER" = "space_windows_change" ] || [ "$SENDER" = "space_change" ]; then
#   sketchybar --set icon.1
# fi

CONFIG=(
  # background.drawing=off
  # background.color="$ACCENT_COLOR"
  icon.highlight="$SELECTED"
  # background.drawing=off
  # label="${APP_LABEL[@]}"
  label.drawing=off
)

sketchybar --set "$NAME" "${CONFIG[@]}"
