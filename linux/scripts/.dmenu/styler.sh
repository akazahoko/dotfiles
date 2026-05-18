#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "wallpaper:󰸉\tWallpaper"
    "theme:\ttheme"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"