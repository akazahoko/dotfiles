#!/bin/zsh

SCRIPT_DIR="${0:A:h}"
source "$SCRIPT_DIR/.helper.sh"

wallpaper() {

    SOURCE_DIR="$(xdg-user-dir PICTURES)/Grabber"

    fd . "$SOURCE_DIR" | \
    fzf --bind "enter:execute(awww img {})" \
        --bind "F5:reload(fd . $SOURCE_DIR)" \
        --preview ''$CHAFA' {}'
}

theme() {
    "$SCRIPT_DIR"/.dmenu/theme.sh
}

idk_function $1