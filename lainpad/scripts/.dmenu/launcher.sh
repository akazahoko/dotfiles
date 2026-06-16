#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "app:󰀻\tApps"
    "pacman:󰏗\tPackages"
    "rclone:󰅟\tRclone"
    "picker:󰜬\tPicker"
    "capture:󰄀\tCapture"
    "search:󰍉\tFiles"
    "styler:󰃣\tStyle"
    "toggle:󰔡\tToggle"
    # "settings:\tSettings"
    "power:󰐥\tPower"
)

prompt_opt "${LIST[@]}"
${0:A:h}/$OPTION.sh