#!/bin/zsh

ICON_DIR="${0:A:h:h}/.icons/osd"

notify_std() {
    notify-send -e  \
        -a osd  \
        -u low  \
        -h string:x-canonical-private-synchronous:osd-"$1"  \
        -i "$2" \
        -t 1000 \
        "$3"    \
        "$4"
}

notify_slider() {
    notify-send -e  \
        -a osd  \
        -u low  \
        -h string:x-canonical-private-synchronous:osd-"$1"  \
        -i "$2" \
        -t 1000 \
        "$3"    \
        "$4"    \
        -h int:value:"$5"
}

# usage: notify_std "id" "icon" "title" "content" ("slider")