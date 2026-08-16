#!/bin/zsh

source "${0:A:h:h}/helper.sh"

function ddc() {
    ddcutil --disable-dynamic-sleep \
        --noverify \
        --skip-ddc-checks \
        --sleep-multiplier 0.1 -b 3 \
        "$@"
}

function ddc_notify() {
    BRIGHTNESS=$(ddc getvcp 10 | awk '/current value/ {print $9}' | tr -d ',')

    if (("$BRIGHTNESS" >= 65)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_3.png
    elif (("$BRIGHTNESS" >= 35)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_2.png
    elif (("$BRIGHTNESS" > 0)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_1.png
    elif (("$BRIGHTNESS" == 0)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_0.png
    fi

    notify_slider "brightness" "$ICON" "Display Brightness" "$BRIGHTNESS" "$BRIGHTNESS"
}

function bnctl_notify() {
    local BRIGHTNESS=$(brightnessctl get)
    local MAX_BRIGHTNESS=$(brightnessctl max)
    local PERCENT=$(( ($BRIGHTNESS * 100) / $MAX_BRIGHTNESS ))

    if (("$BRIGHTNESS" >= 65)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_3.png
    elif (("$BRIGHTNESS" >= 35)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_2.png
    elif (("$BRIGHTNESS" > 0)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_1.png
    elif (("$BRIGHTNESS" == 0)); then
        ICON=$ICON_DIR/osd/nf-md-brightness_0.png
    fi

    notify_slider "brightness" "$ICON" "Display Brightness" "$PERCENT" "$PERCENT"
}

function ddc_up() {
    ddc setvcp 10 + 10
    ddc_notify
}

function ddc_down() {
    ddc setvcp 10 - 10
    ddc_notify
}

function bnctl_up() {
    brightnessctl set +5%
    bnctl_notify
}

function bnctl_down() {
    bnctl_notify
    brightnessctl set 5%-
}

$1