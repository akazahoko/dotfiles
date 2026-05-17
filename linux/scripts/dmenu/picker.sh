#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "clipboard:󰅇\tClipboard"
    "emojis:󰱨\tEmojis"
    "nerdglyphs:\tNerdglyphs"
    "pipette:\tColor Picker"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"