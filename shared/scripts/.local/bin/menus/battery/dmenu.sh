#!/bin/zsh

NAME="battery"
PROMPTS=(
    "noti"
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