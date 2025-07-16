#!/bin/bash

COMPONENT=(
  item
  meta
  q
)

# IMAGE_GEN="dscl . -read /Users/`id -un` JPEGPhoto | tail -1 | xxd -r -p > ~/.config/sketchybar/cache/pfp.jpg"

CONFIG=(
  background.image="~/.config/sketchybar/cache/pfp.jpg"
  background.image.drawing=on
  background.image.scale=0.02
  background.image.corner_radius=9
  background.image.padding_left=5
  icon="...."
  icon.font_color=0x00000000
  label="$(whoami)􀅷$(hostname | cut -d '.' -f 1)"
  popup.background.border_width=5
  popup.background.corner_radius=10
  popup.background.color=0xff9dd274
  popup.background.border_color=0xffffffff
  click_script="$PLUGIN_DIR/meta.sh"
)

SUBSCRIBE=(
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"