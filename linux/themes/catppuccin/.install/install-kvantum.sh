#!/bin/bash

NAME="catppuccin-kvantum"
CONFIG_DIR="$HOME/.config/Kvantum"
TEMP_DIR="/tmp/$NAME"

init() {
    mkdir -p $CONFIG_DIR
}

install() {
    local REPO="https://github.com/catppuccin/kvantum.git" 

    git clone --depth=1 $REPO $TEMP_DIR
    cp -r "$TEMP_DIR/themes/*" $CONFIG_DIR 
}

clean() {
    rm -rf $TEMP_DIR
}

init
install
clean