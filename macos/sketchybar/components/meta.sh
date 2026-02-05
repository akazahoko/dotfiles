#!/bin/bash

COMPONENT=(
  item
  meta
  q
)

# IMAGE_GEN="dscl . -read /Users/`id -un` JPEGPhoto | tail -1 | xxd -r -p > ~/.config/sketchybar/cache/pfp.jpg"

CONFIG=(
  label="$(whoami)􀅷$(hostname | cut -d '.' -f 1)"
  popup.background.border_width=5
  popup.background.corner_radius=10
  popup.background.color=0xff9dd274
  popup.background.border_color=0xffffffff
  click_script="$PLUGIN_DIR/meta.sh"
)

NAME="${COMPONENT[1]}"

sketchybar  --add "${COMPONENT[@]}" \
            --set "${NAME}" "${CONFIG[@]}" \
            --subscribe "${NAME}" "${SUBSCRIBE[@]}"