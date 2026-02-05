#!/bin/zsh

case "$1" in
    waybar)
    pkill waybar
    waybar > /dev/null 2>&1 &
    disown
    TITLE=Waybar
    ;;
esac

sleep 0.1

notify-send -e  \
            -a osd \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-volume \
            -t 1000 \
            "$TITLE"    \
            "RELOADED!"