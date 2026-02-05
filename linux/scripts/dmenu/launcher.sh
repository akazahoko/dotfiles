#!/bin/zsh

function show_menu() {
    printf '%b\n' "${LIST[@]}" | \
    fuzzel  --dmenu \
            --width=30  \
            --nth-delimiter=:   \
            --with-nth=2    \
            --accept-nth=1  \
            --hide-prompt   | \
        xargs -o echo   | \
        sed 's/.* delim: : (3a) //'
}

function exec_term() {
    if [[ ${funcstack[-1]}  == "main" ]]; then
        CALLER=${funcstack[-2]}
    else
        CALLER=${funcstack[-1]}
    fi

    if [ $# -eq 0 ]; then
        ARG=$(show_menu)
    else
        ARG=$1
    fi
    
    pkill -f "foot -a menu -T $CALLER:$ARG" || \
    foot -a menu -T $CALLER:$ARG ~/.dotfiles/linux/scripts/dmenu/$CALLER.sh $ARG
}

function pacman() {
    LIST=(
        "install_pkg:󱧕\tInstall package(s)"
        "install_aur:\tInstall AUR package(s)"
        "manage_pkg:󰏖\tManage local packages"
        "update_pkg:󰚰\tUpdate package(s)"
        "update_aur:\tUpdate AUR package(s)"
        "show_version:󰮯\tPacman info"
    )
    exec_term $1
}

function clipboard() {
    LIST=(
        "clipboard:󰅇\tClipboard"
        "emojis:󰞅\tEmojis"
        "nerdglyphs:\tNerd Font Cheat Sheet"
    )
    exec_term $1
}

function wallpaper() {
    exec_term wallpaper
}

function power() {
    LIST=(
        "suspend:󰤄\t睡眠"
        "shutdown:󰤂\t關機"
        "reboot:󰜉\t重新啟動"
        "lock:󰌾\t鎖定"
        "logout:󰍃\t登出"
    )
    exec_term
}

function search() {
    echo foobar
}

function settings() {
    LIST=(
        "network:󰛳\t網絡"
        "sound:󰋋\t聲音"
        "theme:󰏘\t主題"
    )
    exec_term
}

function app() { 
    fuzzel 
}

function main() {
    LIST=(
        "app:󰀻\tLaunch App"
        "pacman:󰏗\tPackages"
        "wallpaper:󰸉\tChange Wallpaper"
        "clipboard:󰅇\t剪貼簿"
        "search:󰍉\tSearch File"
        # "tools:󱁤\t工具"
        # "settings:󰆍\t系統設定"
        "power:󰐥\t電源選項"
    )
    $(show_menu)
}

if [ $# -eq 0 ]; then
    main
else
    $1 $2
fi