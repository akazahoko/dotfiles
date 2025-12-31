#!/bin/bash

# Weird bug: capsLock is always on
sleep 0.1

get_state() {
    hyprctl devices | grep -A7 "Keyboard" | grep "$1: yes"
}

set_capslock() {
    if get_state capsLock; then
        STATUS="已開啟"
    else
        STATUS="已關閉"
    fi
}

set_numlock() {
    if get_state numLock; then
        STATUS="已開啟"
    else
        STATUS="已關閉"
    fi
}

case "$1" in
    capslock)
    TITLE="Caps Lock"
    ICON=~/Icons/nf-md-caps_lock.png
    set_capslock
    ;;
    numlock)
    TITLE="Number Lock"
    ICON=~/Icons/nf-md-num_lock.png
    set_numlock
esac

notify-send -e      \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-lock  \
            -i "$ICON"    \
            -t 1000 \
            "$TITLE"    \
            "$STATUS"       