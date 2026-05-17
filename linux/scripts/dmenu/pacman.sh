#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "install_pkg:󱧕\tInstall package(s)"
    "install_aur:\tInstall AUR package(s)"
    "manage_pkg:󰏖\tManage local packages"
    "update_pkg:󰚰\tUpdate package(s)"
    "update_aur:\tUpdate AUR package(s)"
    "version:󰮯\tPacman info"
)

prompt_opt "${LIST[@]}"
open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"