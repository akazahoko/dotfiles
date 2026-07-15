#!/bin/zsh

NAME="styler"
PROMPTS=(
    "wallpaper:󰸉\tWallpaper"
    "theme:󰏘\tTheme"
)

source "${0:A:h}/.helper.sh"

case $OPTION in
    wallpaper)open_in_term;;
    theme)${0:A:h}/theme.sh;;
esac