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

source "${0:A:h}/.helper.sh"

case $OPTION in
    *)open_direct;;
esac