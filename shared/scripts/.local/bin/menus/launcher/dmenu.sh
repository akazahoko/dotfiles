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

source "${0:A:h:h}/helper.sh"
prompt_user

case $OPTION in
    app)fuzzel;;
    *)${0:A:h:h}/$OPTION/dmenu.sh
esac