#!/bin/zsh

THEME_DIR="${0:A:h:h:h}"

FLAVOR=""
INPUT_HIGHLIGHT=$1

HIGHLIGHTS=()

if [[ ${HIGHLIGHTS[(I)$INPUT_HIGHLIGHT]} -eq 0 ]]; then
    echo "Error: $INPUT_HIGHLIGHT is not a valid highlight."
    exit 1
fi

theme=""
prefer_dark="true"

"$THEME_DIR/.helper/theme-gtk.sh" $theme $prefer_dark