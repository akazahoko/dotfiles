#!/bin/zsh

source "${0:A:h}/.helper.sh"

wallpaper() {

    SOURCE_DIR="$(xdg-user-dir PICTURES)/Grabber"

    fd . "$SOURCE_DIR" | \
    fzf --bind "enter:execute(awww img {})" \
        --bind "F5:reload(fd . $SOURCE_DIR)" \
        --preview ''$CHAFA' {}'
}

theme() {

}

idk_function $1