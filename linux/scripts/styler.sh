#!/bin/zsh

source "${0:A:h}/.helper.sh"

wallpaper() {
    fd . "$(xdg-user-dir PICTURES)/Grabber" | \
    fzf --bind "enter:execute(awww img {})" \
        --bind "F5:reload(fd . \"$HOME/圖片/Grabber\")" \
        --preview ''$CHAFA' {}'
}

idk_function $1