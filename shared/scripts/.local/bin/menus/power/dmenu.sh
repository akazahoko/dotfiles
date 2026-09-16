#!/bin/zsh

NAME="power"

INHIBITOR=$(systemd-inhibit --list --no-pager | grep -i "DONTFUCKINGSLEEP")

if [[ -z "$INHIBITOR" ]]; then
    INHIBITOR_STATE="\t防止睡眠"
else
    INHIBITOR_STATE="\t允許睡眠"
fi

if pgrep -x "hyprsunset" >/dev/null; then
    NIGHT_STATE="\t夜間模式"
else
    NIGHT_STATE="\t夜間模式"
fi

PROMPTS=(
    "suspend:󰤄\t睡眠"
    "shutdown:\t關機"
    "reboot:󰑓\t重新啟動"
    "toggle_dpms:󰶐\t關閉螢幕"
    "exit_hypr:󰈆\t離開"
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
