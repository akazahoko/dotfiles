#!/bin/zsh

THEME_DIR="${0:A:h:h:h}"

FLAVOR="rose-pine-moon"

theme="$FLAVOR-gtk"
prefer_dark="true"

"$THEME_DIR/.helper/theme-gtk.sh" $theme $prefer_dark