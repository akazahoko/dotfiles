#!/bin/bash

COMPONENT=(
  item
  weather
  e
)

CONFIG=(
  update_freq=3600
  script="$PLUGIN_DIR/weather.sh"
  click_script="open https://www.hko.gov.hk"
  label.padding_left=0
  popup.align=center
)

POP=(
  item
  weather_pop
  popup.weather
)

POP_CONFIG=(
  icon.drawing=off
  # label.position=left
)

SUBSCRIBE=(
  mouse.entered
  mouse.exited
)

NAME="${COMPONENT[1]}"
POP_NAME="${POP[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --add "${POP[@]}" \
            --set "${POP_NAME}" "${POP_CONFIG[@]}"  \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"
