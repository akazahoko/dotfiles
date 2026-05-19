#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "clipboard:󰅇\tClipboard"
    "pipette:󰈊\tColor"
    "emojis:󰱨\tEmojis"
    "nerdglyphs:\tNerdglyphs"
)

prompt_opt "${LIST[@]}"

if [[ "$OPTION" == "pipette" ]]; then
    "${0:A:h:h}/${0:t}" $OPTION
else
    open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"
fi