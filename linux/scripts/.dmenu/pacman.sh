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

source "${0:A:h}/.helper.sh"

case $OPTION in
    *)open_in_term;;
esac