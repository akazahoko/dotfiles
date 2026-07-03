#!/bin/zsh

NAME="rclone"
PROMPTS=(
    "sync_remote_local:󰇚\tRemote -> Local"
    "sync_local_remote:󰕒\tLocal -> Remote"
    "mount_remote:\tMount Remote"
)

source "${0:A:h}/.helper.sh"

case $OPTION in
    *)open_in_term;;
esac