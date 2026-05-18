#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "app:󰀻\tApps"
    "pacman:󰏗\tPackages"
    "rclone:󰅟\tRclone"
    "picker:󰅇\tPicker"
    "capture:󰹑\tCapture"
    "search:󰍉\tFiles"
    "styler:󰸉\tStyling"
    # "tools:󱁤\t工具"
    # "settings:󰆍\t系統設定"
    "reload:󰑓\tReload"
    "power:󰐥\tPower"
)

prompt_opt "${LIST[@]}"
${0:A:h}/$OPTION.sh