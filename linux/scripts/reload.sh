#!/bin/zsh

SCRIPT_DIR=${0:A:h}
source $SCRIPT_DIR/.helper.sh

reload_waybar() {
    pkill waybar
    waybar > /dev/null 2>&1 &
    disown
    TITLE=Waybar
    "${SCRIPT_DIR}"/osd/reload.sh waybar
}

idk_function $1
sleep 0.1