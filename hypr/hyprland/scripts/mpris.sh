#!/bin/bash

case "$1" in
    next)
        playerctl next
        ;;
    previous)
        playerctl previous
        ;;
    play-pause)
        playerctl play-pause
        # notify-send -e -h string:x-canonical-private-synchronous:osd-mpris -i $(playerctl metadata mpris:artUrl) "$(playerctl metadata xesam:title)" "已暫停"
        ;;
esac