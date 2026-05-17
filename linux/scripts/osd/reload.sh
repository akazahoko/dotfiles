#!/bin/zsh

source "${0:A:h}/.helper.sh"

case $1 in
    waybar)
        TITLE="Waybar"
    ;;
esac


notify_std "reload" "" $TITLE "RELOADED!" 