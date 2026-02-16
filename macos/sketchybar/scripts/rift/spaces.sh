#!/bin/bash

BUNDLE_IDS=($(
    rift-cli query workspaces | jq --arg space "$NAME" -r '
        .[] | 
        select(.name == ($space | split(".")[1])) | 
        .windows[].bundle_id
    '
))

for i in "${BUNDLE_IDS[@]}"; do
    case $i in 
        "WhatsApp")             WINDOWS+=" ";;
        "Firefox")              WINDOWS+=" ";;
        "Zen")                  WINDOWS+=" ";;
        "Floorp")               WINDOWS+=" ";;
        "Code")                 WINDOWS+=" ";;
        "Finder")               WINDOWS+="󰀶 ";;
        "iTerm2")               WINDOWS+=" ";;
        "kitty")                WINDOWS+="󰄛 ";;
        "Microsoft Word")       WINDOWS+="󱎒 ";;
        "Microsoft Excel")      WINDOWS+="󱎏 ";;
        "Microsoft PowerPoint") WINDOWS+="󱎐 ";;
        "Microsoft Outlook")    WINDOWS+="󰴢 ";;
        "Discord")              WINDOWS+=" ";;
        "Obsidian")             WINDOWS+=" ";;
        "Xournal++")             WINDOWS+=" ";;
        "文字編輯")                 WINDOWS+=" ";;
        "系統設定")                 WINDOWS+=" ";;
        "預覽程式")                 WINDOWS+="󰍅 ";;
        *) WINDOWS+="$i "
    esac
done

if [ $NAME = space.$RIFT_WORKSPACE_NAME ]; then
    FOCUSED=1
    IS_DRAWN=1
fi

SPACE_WINDOW_COUNT=$(
    rift-cli query workspaces | jq --arg space "$NAME" '
        .[] | 
        select(.name == ($space | split(".")[1])) | 
        .window_count
    '
)

if [ "$SPACE_WINDOW_COUNT" -ne 0 ]; then
    IS_DRAWN=1
fi

PROPERTIES=(
    background.drawing=$FOCUSED \
    drawing=$IS_DRAWN
    label=$WINDOWS
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
