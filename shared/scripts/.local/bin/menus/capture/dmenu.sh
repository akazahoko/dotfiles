#!/bin/zsh

NAME="capture"
PROMPTS=(
    "region:\tRegion"
    "window:\tWindow"
    "monitor:\tMonitor"
    "preview:\tPreview"
    "open_dir:\tHyprshot"
    "open_last:\tView"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
    preview)spawn_terminal;;
    *)spawn_direct;;
esac