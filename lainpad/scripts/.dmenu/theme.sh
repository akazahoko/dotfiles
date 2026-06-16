#!/bin/zsh

source "${0:A:h}/.helper.sh"

THEME_DIR="${0:A:h:h:h}/themes"

LIST=(
    "catppuccin/latte:Catppuccin Latte"
    "catppuccin/frappe:Catppuccin Frappe"
    "catppuccin/macchiato:Catppuccin Macchiato"
    "catppuccin/mocha:Catppuccin Mocha"
    "rose-pine/main:Rosé Pine"
    "rose-pine/moon:Rosé Pine Moon"
    "rose-pine/dawn:Rosé Pine Dawn"
)

prompt_opt "${LIST[@]}"

THEME_NAME="${OPTION%/*}"
THEME_FLAVOR="${OPTION#*/}"

$THEME_DIR/$THEME_NAME/theme.sh $THEME_FLAVOR