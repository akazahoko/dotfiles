#!/bin/bash

if systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP"; then
    pkill -f DONTFUCKINGSLEEP &
    ICON=~/Icons/nf-md-sleep.png
    STATUS=已關閉
else
    systemd-inhibit --what=idle:sleep --mode=block --who="DONTFUCKINGSLEEP" sleep infinity &
    ICON=~/Icons/nf-md-sleep_off.png
    STATUS=已開啟
fi

notify-send -e  \
            -u low  \
            -h string:x-canonical-private-synchronous:osd-idleinhibitor \
            -i "$ICON"  \
            -t 1000 \
            "防止閒置"  \
            "$STATUS"