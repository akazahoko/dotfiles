#!/bin/zsh

source "${0:A:h}/.helper.sh"

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
}

update_pkg() {
    sudo pacman -Syu
    eval "$CONTINUE"
}

update_aur() {
    yay -Syua
    eval "$CONTINUE"
}

clean_orphans() {
    ORPHANS=$(pacman -Qtdq)

    if [[ -n $ORPHANS ]]; then
        sudo pacman -Rns $ORPHANS
    else
        echo "NO Orphans"
    fi

    eval "$CONTINUE"
}

print_version() {
    pacman --version
    eval "$CONTINUE"
}

$1