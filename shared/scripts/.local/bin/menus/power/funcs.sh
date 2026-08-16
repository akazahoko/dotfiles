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

toggle_inhibitor() {
    INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

    if [[ -z "$INHIBITOR" ]]; then
        systemd-inhibit --what=idle:sleep --mode=block --who="DONTFUCKINGSLEEP" sleep infinity &
        local ICON="$ICON_DIR/osd/nf-md-sleep_off.png"
        local MSG="On"
    else
        pkill -f DONTFUCKINGSLEEP &
        local ICON="$ICON_DIR/osd/nf-md-sleep.png"
        local MSG="Off"
    fi

    notify_std "inhibitor" "$ICON" "Inhibitor" "$MSG"
}

toggle_dpms() {
    sleep 0.5 &&
        hyprctl dispatch "hl.dsp.dpms({ action = "off" })"
}

toggle_night() {
    if pgrep -x "hyprsunset" >/dev/null; then
        pkill -f hyprsunset &
        local MSG="Off"
    else
        hyprsunset &
        local MSG="On"
    fi

    notify_std "nightmode" "$ICON" "Night Mode" "$MSG"
}

$1
