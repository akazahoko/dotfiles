#!/bin/zsh

TOGGLE_ON=
TOGGLE_OFF=

wifi_status() {
    echo $(nmcli radio wifi)
}

toggle_wifi() {
    local STATUS=$(wifi_status)

    case $STATUS in
        disabled)
            nmcli radio wifi on;;
        enabled)
            nmcli radio wifi off;;
    esac
}

bt_status() {
    echo $(bluetoothctl show | grep Powered | awk '/Powered:/ {print $2}')
}

toggle_bt() {
    local STATUS=$(bt_status)

    case $STATUS in
        yes)
            bluetoothctl power off;;
        no)
            bluetoothctl power on;;
    esac
}

vol_out_status() {
    local STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

    if [[ $STATUS == "[MUTED]" ]]; then
        echo muted
    else
        echo unmuted
    fi
}

vol_in_status() {
    local STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')
    
    if [[ $STATUS == "[MUTED]" ]]; then
        echo muted
    else
        echo unmuted
    fi
}

toggle_mute_out() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
}

toggle_mute_in() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

inhibitor_status() {
    INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

    if [[ -z "$INHIBITOR" ]] ; then
        echo on
    else
        echo off
    fi
}

toggle_inhibitor() {
    local STATUS=$(inhibitor_status)

    case $STATUS in
        on)
            systemd-inhibit --what=idle:sleep --mode=block --who="DONTFUCKINGSLEEP" sleep infinity &
        ;;
        off)
            pkill -f DONTFUCKINGSLEEP &
        ;;
    esac
}

night_status() {
    if pgrep -x "hyprsunset" > /dev/null; then
        echo on
    else
        echo off
    fi
}

toggle_night() {
    local STATUS=$(night_status)

    case $STATUS in
        on)
            pkill -f hyprsunset &
        ;;
        off)
            hyprsunset &
        ;;
    esac
}

set_status_icons() {
    case $(wifi_status) in
        enabled)WIFI_STATUS=$TOGGLE_ON;;
        disabled)WIFI_STATUS=$TOGGLE_OFF;;
    esac

    case $(bt_status) in
        yes)BT_STATUS=$TOGGLE_ON;;
        no)BT_STATUS=$TOGGLE_OFF;;
    esac

    case $(vol_out_status) in
        muted)VOL_OUT_STATUS=$TOGGLE_OFF;;
        unmuted)VOL_OUT_STATUS=$TOGGLE_ON;;
    esac

    case $(vol_in_status) in
        muted)VOL_IN_STATUS=$TOGGLE_OFF;;
        unmuted)VOL_IN_STATUS=$TOGGLE_ON;;
    esac

    case $(inhibitor_status) in
        on)INHIBITOR_STATUS=$TOGGLE_OFF;;
        off)INHIBITOR_STATUS=$TOGGLE_ON;;
    esac

    case $(night_status) in
        on)NIGHT_STATUS=$TOGGLE_ON;;
        off)NIGHT_STATUS=$TOGGLE_OFF;;
    esac
}

set_status_icons

NAME="quicksettings"
PROMPTS=(
    "wifi:$WIFI_STATUS\tWi-Fi 󰖩"
    "bluetooth:$BT_STATUS\tBluetooth 󰂯"
    "vol_out:$VOL_OUT_STATUS\tAudio (Output)"
    "vol_in:$VOL_IN_STATUS\tAudio (Input)"
    "inhibitor:$INHIBITOR_STATUS\tSleep Inhibitor"
    "night:$NIGHT_STATUS\tNight Mode"
)

source "${0:A:h}/.helper.sh"

case $OPTION in
    wifi)toggle_wifi;;
    bluetooth)toggle_bt;;
    vol_out)toggle_mute_out;;
    vol_in)toggle_mute_in;;
    inhibitor)toggle_inhibitor;;
    night)toggle_night;;
esac

echo $VOL_OUT_STATUS