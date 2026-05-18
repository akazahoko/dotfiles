#!/bin/zsh

THEME_DIR="${0:A:h:h:h}"

FLAVOR="rose-pine-dawn"

theme="$FLAVOR-gtk"
prefer_dark="false"

"$THEME_DIR/.helper/theme-gtk.sh" $theme $prefer_dark