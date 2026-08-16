#!/bin/zsh

NAME="mediacontrol"
PROMPTS=(
    "vol_sink_up"
    "vol_sink_down"
    "vol_sink_mute"
    "vol_src_up"
    "vol_src_down"
    "vol_src_mute"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
    *)spawn_direct;;
esac