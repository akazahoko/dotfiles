#!/bin/zsh

NAME="pacman"
PROMPTS=(
    "install_pkg:󱧕\t安裝"
    "update_pkg:󰚰\t更新"
    "install_aur:\t安裝 (AUR)"
    "update_aur:\t更新 (AUR)"
    "manage_pkg:󱧖\t管理及移除"
    "clean_orphans:󰃢\t清除棄置包"
    "print_version:󰮯\t關於Pacman"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
*) spawn_terminal ;;
esac
