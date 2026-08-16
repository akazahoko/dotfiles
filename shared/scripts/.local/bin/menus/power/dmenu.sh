#!/bin/zsh

NAME="power"

INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

if [[ -z "$INHIBITOR" ]] ; then
    INHIBITOR_STATE="󰒳\tInhibitor ON"
else
    INHIBITOR_STATE="󰒲\tInhibitor OFF"
fi

PROMPTS=(
    "suspend:󰤄\tSuspend"
    "shutdown:\tShutdown"
    "reboot:󰜉\tReboot"
    "toggle_inhibitor:$INHIBITOR_STATE"
    "toggle_dpms:󰶐\tDPMS"
    "exit_hypr:󰈆\tExit"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
    *)spawn_direct;;
esac