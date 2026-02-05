#!/bin/zsh

REMOTE_NAME=HKUST
LOCAL_DIR=$HOME/HKUST

rclone mount "$REMOTE_NAME": "$LOCAL_DIR" \
        --vfs-cache-mode=full   \
        --file-perms=0777