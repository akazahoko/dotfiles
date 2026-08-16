#!/bin/zsh

source "${0:A:h:h}/helper.sh"

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
        ICON="$ICON_DIR/osd/nf-md-sleep_off.png"
    else
        off_inhibitor
        ICON="$ICON_DIR/osd/nf-md-sleep.png"
    fi

    notify_std "inhibitor" "$ICON" "Inhibitor" "$STATUS" 
}

toggle_dpms() {
    sleep 0.5 &&
    hyprctl dispatch "hl.dsp.dpms({ action = "off" })"
}

$1