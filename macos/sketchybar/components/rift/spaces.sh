#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")

for i in "${!SPACE_ICONS[@]}"; do
    SID="$((i + 1))"
    PROPERTIES=(
        icon="${SPACE_ICONS[i]}"
        icon.padding_left=10
        icon.padding_right=0
        background.color=0xffbd59bd \
        background.corner_radius=0 \
        background.y_offset=-36 \
        script="$CONFIG_DIR/scripts/rift/spaces.sh"
        click_script="rift-cli execute workspace switch $SID"
    )

    SUBSCRIBE=(
        rift_workspace_changed
        rift_windows_changed
    )

    sketchybar  --add item space."$SID" left \
                --set space."$SID" "${PROPERTIES[@]}" \
                --subscribe space."$SID" "${SUBSCRIBE[@]}"
done

sketchybar  --add bracket spaces '/space\..*/'
