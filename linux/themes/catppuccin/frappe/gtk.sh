#!/bin/zsh

THEME_DIR="${0:A:h:h:h}"

FLAVOR="frappe"
INPUT_HIGHLIGHT=$1

HIGHLIGHTS=("blue" "flamingo" "green" "lavender" "maroon" "mauve" "peach" "pink" "red" "rosewater" "sapphire" "sky" "teal" "yellow")

if [[ ${HIGHLIGHTS[(I)$INPUT_HIGHLIGHT]} -eq 0 ]]; then
    echo "Error: $INPUT_HIGHLIGHT is not a valid highlight."
    exit 1
fi

theme="catppuccin-$FLAVOR-$INPUT_HIGHLIGHT-standard+default"
prefer_dark="true"

"$THEME_DIR/.helper/theme-gtk.sh" $theme $prefer_dark