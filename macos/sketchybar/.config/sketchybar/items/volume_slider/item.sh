#!/bin/bash

COMPONENT=(
  slider
  volume_slider
  popup.volume
)

CONFIG=(
  script="$PLUGIN_DIR/volume_slider.sh"
  background.drawing=off
  slider.width=200
  slider.knob="􀀁"
  slider.knob.position=center
  slider.highlight_color="$ACCENT_COLOR"
  slider.background.height=5
  slider.background.corner_radius=10
  slider.background.color=0x00ffffff
)

SUBSCRIBE=(
  mouse.exited
  mouse.clicked
  volume_change
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"
