#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")

for i in "${!SPACE_ICONS[@]}"; do
    SID="$((i + 1))"
    PROPERTIES=(
        space="$SID"
        icon="${SPACE_ICONS[i]}"
        icon.padding_left=10
        icon.padding_right=0
        background.drawing=off
        script="$CONFIG_DIR/scripts/spaces.sh"
        click_script="yabai -m space --focus $SID"
    )

    SUBSCRIBE=(
        space_change
        space_windows_change
    )

    sketchybar  --add space space."$SID" left \
                --set space."$SID" "${PROPERTIES[@]}" \
                --subscribe space."$SID" "${SUBSCRIBE[@]}"
done

sketchybar  --add bracket spaces '/space\..*/'
