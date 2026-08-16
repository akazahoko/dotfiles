#!/bin/zsh

NAME="power"

INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

if [[ -z "$INHIBITOR" ]]; then
    INHIBITOR_STATE="\tInhibitor 󰒳"
else
    INHIBITOR_STATE="\tInhibitor 󰒲"
fi

if pgrep -x "hyprsunset" >/dev/null; then
    NIGHT_STATE="\tNight Mode"
else
    NIGHT_STATE="\tNight Mode"
fi

PROMPTS=(
    "suspend:󰤄\tSuspend"
    "shutdown:\tShutdown"
    "reboot:󰑓\tReboot"
    "toggle_dpms:󰶐\tDPMS"
    "exit_hypr:󰈆\tExit"
    "toggle_inhibitor:$INHIBITOR_STATE"
    "toggle_night:$NIGHT_STATE"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
*) spawn_direct ;;
esac
