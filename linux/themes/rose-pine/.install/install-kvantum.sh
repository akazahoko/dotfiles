#!/bin/bash

NAME="rose-pine-kvantum"
CONFIG_DIR="$HOME/.config/Kvantum"
TEMP_DIR="/tmp/$NAME"

init() {
    mkdir -p $CONFIG_DIR
}

install() {
    local REPO="https://github.com/rose-pine/kvantum.git" 

    git clone --depth=1 $REPO $TEMP_DIR
    cd "$TEMP_DIR/dist" || exit 1

    for file in *.tar.gz; do
        tar -xzf "$file" -C $CONFIG_DIR
    done
}

clean() {
    rm -rf $TEMP_DIR
}

init
install
clean