#!/bin/zsh

NAME="palette"
PROMPTS=(
    "clipboard:󰅇\tClipboard"
    "pipette:󰈊\tColor"
    "emojis:󰱨\tEmojis"
    "nerdglyphs:\tNerdglyphs"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
pipette) spawn_direct ;;
*) spawn_terminal ;;
esac
