#!/bin/bash

sketchybar  --add item sep left           \
            --set sep icon="|"            \
                  label.drawing=off       \
                  background.drawing=off  \
                  icon.font.style=regular

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "=")

for i in "${!SPACE_ICONS[@]}"; do
  SID="$(($i + 1))"
  CONFIG=(
    space="$SID"
    icon="${SPACE_ICONS[i]}:"
    icon.padding_left=7
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $SID"
  )
  sketchybar  --add space space."$SID" left \
              --set space."$SID" "${CONFIG[@]}" \
              --subscribe space."$SID" space_windows_change space_change
done

sketchybar  --add bracket spaces front_app sep '/space\..*/' \
            --set spaces background.height=35
