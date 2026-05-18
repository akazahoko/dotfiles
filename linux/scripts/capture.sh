#!/bin/zsh

source "${0:A:h}/.helper.sh"

region() {
    hyprshot -m region
}

window() {
    hyprshot -m window
}

monitor() {
    hyprshot -m output -m active
}

preview() {
    fd . "$HYPRSHOT_DIR" | \
    fzf --tac --preview ''$CHAFA' {}'
}

open_dir() {
    xdg-open $HYPRSHOT_DIR &
}

idk_function $1