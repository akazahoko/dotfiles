#!/bin/bash

get_sink() {
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
    STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')
    SLIDER="$VOLUME"
}

get_source() {
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2 * 100}')
    STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')
    SLIDER="$VOLUME"
}

set_sink() {
    get_sink
    TITLE="音量控制: 輸出"
    SLIDER="$VOLUME"

    if [ "$STATUS" == "[MUTED]" ]; then
        VOLUME="已靜音"
        ICON=~/Icons/nf-fa-volume_mute.png
    elif (( "$VOLUME" >= 65 )); then
        ICON=~/Icons/nf-fa-volume_high.png
    elif (( "$VOLUME" >= 35 )); then
        ICON=~/Icons/nf-fa-volume_middle.png
    elif (( "$VOLUME" > 0 )); then
        ICON=~/Icons/nf-fa-volume_low.png
    elif (( "$VOLUME" == 0 )); then
        ICON=~/Icons/nf-fa-volume_zero.png
    fi
}

set_source() {
    get_source
    TITLE="音量控制: 輸入"

    if [ "$STATUS" == "[MUTED]" ]; then
        VOLUME="已靜音"
        ICON=~/Icons/nf-md-microphone_off.png
    else
        ICON=~/Icons/nf-md-microphone.png
    fi
}

case "$1" in
    sink)
        case "$2" in
        up)
            wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 0.01+
        ;;
        down)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-
        ;;
        mute)
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
        esac
        set_sink
    ;;
    source)
        case "$2" in
        up)
            wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 0.01+
        ;;
        down)
            wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0.01-
        ;;
        mute)
            wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        ;;
        esac
        set_source
    ;;
esac

notify-send -e \
            -u low \
            -h string:x-canonical-private-synchronous:osd-volume \
            -i "$ICON" \
            -h int:value:"$SLIDER" \
            -t 1000 \
            "$TITLE" \
            "$VOLUME"