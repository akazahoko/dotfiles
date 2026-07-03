#!/bin/zsh

PROMPTS=(
    "app:󰀻\tApps"
    "pacman:󰏗\tPackages"
    "rclone:󰅟\tRclone"
    "palette:󰏘\tPalette"
    "capture:󰄀\tCapture"
    # "search:󰍉\tFiles"
    "styler:󰃣\tStyle"
    "settings:\tSettings"
    "power:󰐥\tPower"
)

source "${0:A:h}/.helper.sh"

case $OPTION in
    app)fuzzel;;
    *)${0:A:h}/$OPTION.sh
esac