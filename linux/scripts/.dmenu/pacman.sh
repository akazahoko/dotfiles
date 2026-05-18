#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "install_pkg:󱧕\tInstall"
    "update_pkg:󰚰\tUpdate"
    "install_aur:\tAUR"
    "update_aur:\tUpdate (AUR)"
    "manage_pkg:󱧖\tDelete"
    "clean_orphans:󰃢\tClean Orphans"
    "print_version:󰮯\tInfo"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"