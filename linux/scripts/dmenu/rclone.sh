#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "sync_remote_local:Sync Remote to Local"
    "sync_local_remote:Sync Local to Remote"
    "mount_remote:󰮯\tMount remote"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"