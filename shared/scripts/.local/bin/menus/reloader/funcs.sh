#!/bin/zsh

source "${0:A:h:h}/helper.sh"

reload_waybar() {
    pkill waybar
    waybar > /dev/null 2>&1 &
    disown
    TITLE=Waybar
}

$1
sleep 0.1
notify_std "reload" "" $TITLE "RELOADED!" 