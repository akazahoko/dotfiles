#!/bin/zsh

source "${0:A:h}/.helper.sh"

function get_brightness() {
	CURRENT=$(brightnessctl get)
	MAX=$(brightnessctl max)
	BRIGHTNESS=$(($CURRENT * 100 / $MAX))
}

function set_brightness() {
	brightnessctl set $1
   
	get_brightness

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

LEVEL=$2

case "$1" in
    up) set_brightness "+$LEVEL%";;
    down) set_brightness "$LEVEL%-";;
esac

notify_slider "brightness" "$ICON" "Display Brightness" "$BRIGHTNESS" "$BRIGHTNESS"
