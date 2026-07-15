#!/bin/zsh

NAME="palette"
PROMPTS=(
    "clipboard:󰅇\tClipboard"
    "pipette:󰈊\tColor"
    "emojis:󰱨\tEmojis"
    "nerdglyphs:\tNerdglyphs"
)

source "${0:A:h}/.helper.sh"

case $OPTION in
    pipette)open_direct;;
    *)open_in_term;;
esac