#!/bin/bash

WID=($(
    yabai -m query --spaces --space $SID | \
    jq -r '.windows[]'
))

for i in "${WID[@]}"; do
    APP="$(
        yabai -m query --windows --window $i | \
        jq -r '.app'
    )"
    case $APP in 
        "WhatsApp")             WINDOWS+=" ";;
        "Firefox")              WINDOWS+=" ";;
        "Code")                 WINDOWS+=" ";;
        "Finder")               WINDOWS+="󰀶 ";;
        "iTerm2")               WINDOWS+=" ";;
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
        *) WINDOWS+="$APP "
    esac
done

SPACE_FOCUS="$(
    yabai -m query --spaces | \
    jq -r '.[] | select(."has-focus" == true) | .index'
)"

if [ $SID = $SPACE_FOCUS ]; then
    FOCUSED=1
fi

PROPERTIES=(
    label="$WINDOWS"
    background.color=0xffbd59bd
    background.corner_radius=0
    background.y_offset=-36
    background.drawing=$FOCUSED
)

sketchybar --set "space.$SID" "${PROPERTIES[@]}"
