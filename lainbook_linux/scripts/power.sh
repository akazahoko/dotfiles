#!/bin/zsh

LIST=(
    "suspend:󰤄\tSuspend"
    "shutdown:󰤂\tShutdown"
    "reboot:󰜉\tReboot"
    "lock:󰌾\tLock"
    "logout:󰍃\tLogout"
)

action=$(printf '%b\n' "${LIST[@]}" | \
fuzzel  --dmenu \
        --width=15 \
        --nth-delimiter=: \
        --with-nth=2    \
        --accept-nth=1  \
        --hide-prompt   | \
    xargs -o echo   | \
    sed 's/.* delim: : (3a) //'
)

case "$action" in
    suspend)
    systemctl suspend
    ;;
    shutdown)
    systemctl poweroff
    ;;
    reboot)
    systemctl reboot
    ;;
    lock)
    loginctl lock-session
    ;;
    logout)
    hyprctl dispatch exit
    ;;
esac

