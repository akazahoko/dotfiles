#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "app:󰀻\tApp Launcher"
    "rclone:󰍉\tRclone"
    "pacman:󰏗\tPackages"
    "styler:󰸉\tStyler"
    "picker:󰅇\tPicker"
    "scrshot:󰹑\tScreenshot"
    "search:󰍉\tSearch File"
    # "tools:󱁤\t工具"
    # "settings:󰆍\t系統設定"
    "reload:󰑓\tReload"
    "power:󰐥\tPower"
)

prompt_opt "${LIST[@]}"
${0:A:h}/$OPTION.sh