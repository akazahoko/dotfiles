#!/bin/bash

WS_JSON=$(rift-cli query workspaces)

CURRENT_WS_JSON=$(
    echo $WS_JSON | \
    jq -r --arg space "$NAME" '
        .[] |
        select(.name == ($space | split(".")[1]))
    '
)

BUNDLE_IDS=($(echo $CURRENT_WS_JSON | jq -r '.windows[].bundle_id'))
SPACE_WINDOW_COUNT=$(echo $CURRENT_WS_JSON | jq -r '.window_count')

for i in "${BUNDLE_IDS[@]}"; do
    case $i in 
        # Apple
        "com.apple.finder")                 WINDOWS+="󰀶 ";;
        "com.apple.iCal")                   WINDOWS+=" ";;
        "com.apple.Preview")                WINDOWS+="󰍅 ";;
        "com.apple.systempreferences")      WINDOWS+=" ";;
        "com.apple.TextEdit")               WINDOWS+=" ";;
        
        # Microsoft
        "com.microsoft.Excel")              WINDOWS+="󱎏 ";;
        "com.microsoft.Outlook")            WINDOWS+="󰴢 ";;
        "com.microsoft.PowerPoint")         WINDOWS+="󱎐 ";;
        "com.microsoft.VSCode")             WINDOWS+=" ";;
        "com.microsoft.Word")               WINDOWS+="󱎒 ";;

        # Others
        "cc.ffitch.shottr")                 WINDOWS+="󰹑 ";;
        "com.github.xournalpp")             WINDOWS+=" ";;
        "com.hnc.Discord")                  WINDOWS+=" ";;
        "md.obsidian")                      WINDOWS+=" ";;
        "net.kovidgoyal.kitty")             WINDOWS+="󰄛 ";;
        "net.whatsapp.WhatsApp")            WINDOWS+=" ";;
        "org.mozilla.firefox")              WINDOWS+=" ";;
        "org.mozilla.floorp")               WINDOWS+=" ";;

        # Defaults
        *) WINDOWS+="$i "
    esac
done

if [ "$SPACE_WINDOW_COUNT" -ne 0 ]; then
    IS_DRAWN=1
fi

if [ $NAME = space.$RIFT_WORKSPACE_NAME ]; then
    FOCUSED=1
    IS_DRAWN=1
fi

PROPERTIES=(
    background.drawing=$FOCUSED \
    drawing=$IS_DRAWN
    label=$WINDOWS
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
