#!/bin/zsh

source "${0:A:h}/.helper.sh"

REMOTE_NAME=HKUST
MOUNT_DIR=$HOME/HKUST

LOCAL_DIR="$HOME/HKUST"
REMOTE_DIR=HKUST:

mount_remote() {
    rclone mount "$REMOTE_NAME": "$MOUNT_DIR" \
            --vfs-cache-mode=full   \
            --file-perms=0777
}

sync_local_remote() {
    rclone sync $LOCAL_DIR $REMOTE_DIR -P
    eval "$CONTINUE"
}

sync_remote_local() {
    rclone sync $REMOTE_DIR $LOCAL_DIR -P
    eval "$CONTINUE"
}

idk_function $1