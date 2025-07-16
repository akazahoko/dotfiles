#!/bin/bash

COMPONENT=(
  bracket
  systray
  wifi
  volume
  # IME
  battery
)

CONFIG=(
  # click_scipt="open -a calendar"
  # background.color=0xffffffff
)

SUBSCRIBE=(
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"

