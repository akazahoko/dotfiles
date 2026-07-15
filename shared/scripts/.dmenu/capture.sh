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

source "${0:A:h}/.helper.sh"

case $OPTION in
    preview)open_in_term;;
    *)open_direct;;
esac