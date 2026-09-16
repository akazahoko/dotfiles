#!/bin/zsh

NAME="rclone"
PROMPTS=(
    "sync_remote_local:󰇚\tRemote -> Local"
    "sync_local_remote:󰕒\tLocal -> Remote"
    "mount_remote:\tMount Remote"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
    *)spawn_terminal;;
esac
