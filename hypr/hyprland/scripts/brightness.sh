#!/bin/bash

DDCUTIL="ddcutil --disable-dynamic-sleep --noverify --skip-ddc-checks --sleep-multiplier 0.1 -b 3"

get_brightness() {
    $DDCUTIL getvcp 10 | awk '/current value/ {print $9}' | tr -d ','
}

set_brightness() {
    $DDCUTIL setvcp 10 "$1" "$2"
}

set_icon() {
    if (( "$CURRENT" >= 65 )); then
        ICON=~/Icons/nf-md-brightness_3.png
    elif (( "$CURRENT" >= 35 )); then
        ICON=~/Icons/nf-md-brightness_2.png
    elif (( "$CURRENT" > 0 )); then
        ICON=~/Icons/nf-md-brightness_1.png
    elif (( "$CURRENT" == 0 )); then
        ICON=~/Icons/nf-md-brightness_0.png
    fi
}

case "$1" in
    up)
        set_brightness + 10
        ;;
    down)
        set_brightness - 10
        ;;
esac

CURRENT=$(get_brightness)
set_icon
notify-send -e  \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-brightness    \
            -h int:value:"$CURRENT" \
            -i $ICON    \
            -t 1000 \
            "螢幕亮度"  \
            "$CURRENT"  \