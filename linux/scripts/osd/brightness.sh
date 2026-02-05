#!/bin/zsh

ICON_DIR="$HOME/.icons/osd"

function ddc() {
    ddcutil --disable-dynamic-sleep \
            --noverify \
            --skip-ddc-checks \
            --sleep-multiplier 0.1 -b 3 \
            "$@"
}

function set_brightness() {
    ddc setvcp 10 "$@"
    
    CURRENT=$(ddc getvcp 10 | awk '/current value/ {print $9}' | tr -d ',')
    
    if (( "$CURRENT" >= 65 )); then
        ICON=$ICON_DIR/nf-md-brightness_3.png
    elif (( "$CURRENT" >= 35 )); then
        ICON=$ICON_DIR/nf-md-brightness_2.png
    elif (( "$CURRENT" > 0 )); then
        ICON=$ICON_DIR/nf-md-brightness_1.png
    elif (( "$CURRENT" == 0 )); then
        ICON=$ICON_DIR/nf-md-brightness_0.png
    fi
}

case "$1" in
    up) set_brightness + 10;;
    down) set_brightness - 10;;
esac

notify-send -e  \
            -a osd \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-brightness    \
            -i $ICON    \
            -h int:value:"$CURRENT" \
            -t 1000 \
            "Display brightness"  \
            "$CURRENT"