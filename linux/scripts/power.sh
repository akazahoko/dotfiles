#!/bin/zsh

SCRIPT_DIR=${0:A:h}
source $SCRIPT_DIR/.helper.sh

suspend() {
    systemctl suspend
}

shutdown() {
    systemctl poweroff
}

reboot() {
    systemctl reboot
}

lock() {
    loginctl lock-session
}

exit_hypr() {
    hyprctl dispatch 'hl.dsp.exit()'
}

on_inhibitor() {
    systemd-inhibit --what=idle:sleep --mode=block --who="DONTFUCKINGSLEEP" sleep infinity &
    ICON=$ICON_DIR/nf-md-sleep_off.png
    STATUS=On
}

off_inhibitor() {
    pkill -f DONTFUCKINGSLEEP &
    ICON=$ICON_DIR/nf-md-sleep.png
    STATUS=Off
}

toggle_inhibitor() {
    INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

    if [[ -z "$INHIBITOR" ]] ; then
        on_inhibitor
    else
        off_inhibitor
    fi

    "${SCRIPT_DIR}"/osd/inhibitor.sh $STATUS
}

idk_function $1