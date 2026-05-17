#!/bin/zsh

source "${0:A:h}/.helper.sh"

case $1 in
    On)
        ICON="$ICON_DIR/nf-md-sleep_off.png"
    ;;
    Off)
        ICON="$ICON_DIR/nf-md-sleep.png"
    ;;
esac

notify_std "inhibitor" "$ICON" "Inhibitor" "$1"