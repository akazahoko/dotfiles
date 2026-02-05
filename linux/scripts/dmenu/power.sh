#!/bin/zsh

case "$1" in
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