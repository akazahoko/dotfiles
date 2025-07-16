#!/bin/bash

ICON="􀀁"

SPACE_ICONS=("$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON" "$ICON")

# SPACE_COUNT="$(yabai -m query --spaces | jq length)"

for i in "${!SPACE_ICONS[@]}"; do
  SID="$((i + 1))"
  CONFIG=(
    space="$SID"
    icon="${SPACE_ICONS[i]}"
    script="$PLUGIN_DIR/space.sh"
    icon.font="SF Pro:Regular:10.0"
    icon.padding_left=0
    icon.padding_right=0
    background.drawing=off
    click_script="yabai -m space --focus $SID"
  )
  sketchybar  --add space space."$SID" left \
              --set space."$SID" "${CONFIG[@]}" \
              # --subscribe space."$SID" space_change
done
sketchybar  --add bracket spaces '/space\..*/'

