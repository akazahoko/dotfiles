#!/bin/zsh

SCRIPT_DIR=${0:A:h}
source $SCRIPT_DIR/.helper.sh

INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

if [[ -z "$INHIBITOR" ]] ; then
    INHIBITOR_STATE="󰒳\tTurn ON Inhibitor"
else
    INHIBITOR_STATE="󰒲\tTurn OFF Inhibitor"
fi

LIST=(
    "suspend:󰤄\tSuspend"
    "shutdown:\tShutdown"
    "reboot:󰜉\tReboot"
    # "lock:󰌾\tLock"
    "exit_hypr:\tExit Hyprland"
    "toggle_inhibitor:$INHIBITOR_STATE"
)

prompt_opt "${LIST[@]}"
"${0:A:h:h}/${0:t}" $OPTION