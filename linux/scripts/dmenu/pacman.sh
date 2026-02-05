#!/bin/zsh

install_pkg() {
    pacman -Ssq | \
    fzf --multi \
        --reverse \
        --preview "pacman -Si {}" \
        --bind 'enter:execute(sudo pacman -S --needed {+} && read -k 1 -q "?Press any key to continue")+accept' \
        --bind 'alt-h:preview(echo -e "Tab:\tSelect package\nEnter:\tInstall selected package(s)")'
}

install_aur() {
    yay -Slaq | \
    fzf --reverse \
        -m \
        --preview "yay -Si {} " \
        --bind 'enter:execute(yay -S --needed {+} && read -k 1 -q "?Press any key to continue")+accept' \
        --bind 'ctrl-o:execute(xdg-open https://aur.archlinux.org/packages/{})'
}

manage_pkg() {
    pacman -Qq | \
    fzf --reverse \
        -m \
        --preview "pacman -Qi {}"       \
        --bind 'delete:execute(clear; sudo pacman -Rns {+}; read -k1 -q "?Press any key to continue")+reload(pacman -Qq)' \
        --bind 'ctrl-c:execute(clear; sudo pacman -Rns $(pacman -Qtdq); read -k1 -q "?Press any key to continue")+reload(pacman -Qq)' \
        --bind 'ctrl-r:execute(clear; sudo pacman -Syu; read -k1 -q "?Press any key to continue")+reload(pacman -Qq)'    \
        --bind 'ctrl-a:execute(clear; yay -Syua; read -k1 -q "?Press any key to continue")+reload(pacman -Qq)'   \
        --bind 'alt-h:preview(echo -e "Del:\tDelete selected package(s)\nC-c:\tClear orphans\nC-r:\tUpdate system\nC-a:\tUpdate AUR")'
}

update_pkg() {
    sudo pacman -Syu; \
    read -k 1 -q "?Press any key to continue"
}

update_aur() {
    yay -Syua; \
    read -k 1 -q "?Press any key to continue"
}

show_version() {
    pacman --version; \
    read -k 1 -q "?Press any key to continue"
}

$1