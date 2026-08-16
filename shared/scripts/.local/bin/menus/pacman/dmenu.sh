#!/bin/zsh

NAME="pacman"
PROMPTS=(
    "install_pkg:󱧕\tInstall"
    "update_pkg:󰚰\tUpdate"
    "install_aur:\tAUR"
    "update_aur:\tUpdate (AUR)"
    "manage_pkg:󱧖\tDelete"
    "clean_orphans:󰃢\tClean Orphans"
    "print_version:󰮯\tInfo"
)

source "${0:A:h:h}/helper.sh"

if [[ -z "$1" ]]; then
    prompt_user
else
    OPTION="$1"
fi

TITLE=$NAME_$OPTION

case $OPTION in
    *)spawn_terminal;;
esac