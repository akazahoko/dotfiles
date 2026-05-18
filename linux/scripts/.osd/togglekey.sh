#!/bin/zsh

# Weird bug: capsLock is always on
sleep 0.1

function get_state() {
    hyprctl devices | grep -A7 "Keyboard" | grep "$1: yes"
}

function set_capslock() {
    if get_state capsLock; then
        STATUS="On"
    else
        STATUS="Off"
    fi
}

function set_numlock() {
    if get_state numLock; then
        STATUS="On"
    else
        STATUS="Off"
    fi
}

case "$1" in
    capslock)
    TITLE="Caps Lock"
    ICON=~/.icons/osd/nf-md-caps_lock.png
    set_capslock
    ;;
    numlock)
    TITLE="Number Lock"
    ICON=~/.icons/osd/nf-md-num_lock.png
    set_numlock
esac

notify-send -e      \
            -a osd  \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-lock  \
            -i "$ICON"    \
            -t 1000 \
            "$TITLE"    \
            "$STATUS"       