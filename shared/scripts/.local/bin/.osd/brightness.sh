#!/bin/zsh

source "${0:A:h}/.helper.sh"

function ddc() {
    ddcutil --disable-dynamic-sleep \
            --noverify \
            --skip-ddc-checks \
            --sleep-multiplier 0.1 -b 3 \
            "$@"
}

function set_brightness() {
    ddc setvcp 10 "$@"    
    BRIGHTNESS=$(ddc getvcp 10 | awk '/current value/ {print $9}' | tr -d ',')
    
    if (( "$BRIGHTNESS" >= 65 )); then
        ICON=$ICON_DIR/nf-md-brightness_3.png
    elif (( "$BRIGHTNESS" >= 35 )); then
        ICON=$ICON_DIR/nf-md-brightness_2.png
    elif (( "$BRIGHTNESS" > 0 )); then
        ICON=$ICON_DIR/nf-md-brightness_1.png
    elif (( "$BRIGHTNESS" == 0 )); then
        ICON=$ICON_DIR/nf-md-brightness_0.png
    fi
}

case "$1" in
    up) set_brightness + 10;;
    down) set_brightness - 10;;
esac

notify_slider "brightness" "$ICON" "Display Brightness" "$BRIGHTNESS" "$BRIGHTNESS"