#!/bin/zsh

NAME="settings"
PROMPTS=(
    "network:\tNetwork"
    "audio:\tAudio"
    "reload:\tReload Modules"
)

source "${0:A:h}/.helper.sh"

case "$OPTION" in
    network);;
    audio);;
    reload);;
esac