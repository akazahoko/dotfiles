#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "wallpaper:󰸉\tWallpaper"
    "theme:󰏘\tTheme"
)

prompt_opt "${LIST[@]}"

if [[ "$OPTION" == "wallpaper" ]]; then
    open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"
else
    "${0:A:h:h}/${0:t}" $OPTION
fi