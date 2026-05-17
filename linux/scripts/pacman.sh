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

install_pkg() {
    pacman -Ssq | fzf --reverse -m \
        --preview 'pacman -Si {}'   \
        --bind 'enter:execute(sudo pacman -S --needed {+} && '$CONTINUE')+accept' \
        --bind 'alt-h:preview(echo -e "Tab:\tSelect package\nEnter:\tInstall selected package(s)")'
}

install_aur() {
    yay -Slaq | fzf --reverse -m \
        --preview 'yay -Si {}' \
        --bind 'enter:execute(yay -S --needed {+} && '$CONTINUE')+accept' \
        --bind 'ctrl-o:execute(xdg-open https://aur.archlinux.org/packages/{})'
}

manage_pkg() {
    pacman -Qq | fzf --reverse -m \
        --preview 'pacman -Qi {}'   \
        --bind 'delete:execute(clear; sudo pacman -Rns {+}; $PRESS_ANYKEY)+reload(pacman -Qq)' \
        --bind 'ctrl-c:execute(clear; sudo pacman -Rns \$(pacman -Qtdq); $PRESS_ANYKEY)+reload(pacman -Qq)' \
        --bind 'ctrl-r:execute(clear; sudo pacman -Syu; $PRESS_ANYKEY)+reload(pacman -Qq)'    \
        --bind 'ctrl-a:execute(clear; yay -Syua; $PRESS_ANYKEY)+reload(pacman -Qq)'   \
        --bind 'alt-h:preview(echo -e \"Del:\tDelete selected package(s)\nC-c:\tClear orphans\nC-r:\tUpdate system\nC-a:\tUpdate AUR\")'
}

update_pkg() {
    sudo pacman -Syu
    eval "$CONTINUE"
}

update_aur() {
    yay -Syua
    eval "$CONTINUE"
}

version() {
    pacman --version
    eval "$CONTINUE"
}

idk_function $1