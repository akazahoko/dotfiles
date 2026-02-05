#!/bin/zsh

ICON_DIR="$HOME/.icons/osd"

if systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP"; then
    pkill -f DONTFUCKINGSLEEP &
    ICON=$ICON_DIR/nf-md-sleep.png
    STATUS=Off
else
    systemd-inhibit --what=idle:sleep --mode=block --who="DONTFUCKINGSLEEP" sleep infinity &
    ICON=$ICON_DIR/nf-md-sleep_off.png
    STATUS=On
fi

notify-send -e  \
            -a osd \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-idleinhibitor \
            -i "$ICON"  \
            -t 1000 \
            "Idle inhibitor"  \
            "$STATUS"