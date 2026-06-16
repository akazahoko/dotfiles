#!/bin/zsh

SCRIPT_DIR=${0:A:h}
source $SCRIPT_DIR/.helper.sh

LIST=(
    "reload_waybar:Waybar"
)

prompt_opt "${LIST[@]}"
"${0:A:h:h}/${0:t}" $OPTION