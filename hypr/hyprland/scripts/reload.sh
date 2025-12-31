#!/bin/bash

case "$1" in
    swaync)
    pkill swaync
    swaync
    TITLE=SwayNC
    ;;
    waybar)
    pkill waybar
    waybar
    TITLE=Waybar
    ;;
    ags)
    ags quit
    ags run '/home/lain/git/dotfiles/ags/app.ts'
    TITLE=AGS
    ;;
    keyd)
    sudo keyd reload
    TITLE=keyd
    ;;
esac

sleep 0.1

notify-send -e  \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-volume \
            -t 1000 \
            "$TITLE"    \
            "RELOADED!"