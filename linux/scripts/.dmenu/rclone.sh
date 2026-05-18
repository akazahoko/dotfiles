#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "sync_remote_local:󰇚\tRemote -> Local"
    "sync_local_remote:󰕒\tLocal -> Remote"
    "mount_remote:\tMount Remote"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"