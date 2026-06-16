#!/bin/zsh

source "${0:A:h}/.helper.sh"

function set_sink() {
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
    STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')
    TITLE="Output volume"
    SLIDER="$VOLUME"

    if [[ "$STATUS" == "[MUTED]" ]]; then
        VOLUME="Muted"
        ICON=$ICON_DIR/nf-fa-volume_mute.png
    elif (( "$VOLUME" >= 65 )); then
        ICON=$ICON_DIR/nf-fa-volume_high.png
    elif (( "$VOLUME" >= 35 )); then
        ICON=$ICON_DIR/nf-fa-volume_middle.png
    elif (( "$VOLUME" > 0 )); then
        ICON=$ICON_DIR/nf-fa-volume_low.png
    elif (( "$VOLUME" == 0 )); then
        ICON=$ICON_DIR/nf-fa-volume_zero.png
    fi
}

function set_source() {
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $2 * 100}')
    STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')
    SLIDER="$VOLUME"
    TITLE="Input volume"

    if [[ "$STATUS" == "[MUTED]" ]]; then
        VOLUME="Muted"
        ICON=$ICON_DIR/nf-md-microphone_off.png
    else
        ICON=$ICON_DIR/nf-md-microphone.png
    fi
}

case "$1" in
    sink)
        case "$2" in
        up)
            wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ "$3"+
        ;;
        down)
            wpctl set-volume @DEFAULT_AUDIO_SINK@ "$3"-
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
            wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ "$3"+
        ;;
        down)
            wpctl set-volume @DEFAULT_AUDIO_SOURCE@ "$3"-
        ;;
        mute)
            wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        ;;
        esac
        set_source
    ;;
esac

notify_slider "volume" "$ICON" "$TITLE" "$VOLUME" "$SLIDER"