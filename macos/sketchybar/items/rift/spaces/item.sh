#!/bin/bash

NAME=spaces

source "$CONFIG_DIR/variables.sh"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")

for i in "${!SPACE_ICONS[@]}"; do
    if [[ ${SPACE_ICONS[$i]} == "0" ]]; then
        SID="0"
    else
        SID="$((i + 1))"
    fi

    PROPERTIES=(
        icon="${SPACE_ICONS[i]}"
        icon.padding_right=5
        background.color=$HIGHLIGHT_COLOR \
        background.corner_radius=0 \
        background.y_offset=-36 \
        script="$CONFIG_DIR/items/rift/$NAME/script.sh"
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

sketchybar  --add bracket $NAME '/space\..*/'
