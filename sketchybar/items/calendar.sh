#!/bin/bash

COMPONENT=(
  item
  calendar
  e
)

CONFIG=(
  icon.drawing=off
  script="$PLUGIN_DIR/calendar.sh"
  click_script="open -a calendar"
  update_freq=30
)

SUBSCRIBE=(
  is_unlock
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"

