#!/bin/zsh

NAME="catppuccin-gtk"
GTK3_DEST_DIR=$HOME/.themes

install() {
    REPO="catppuccin/gtk"

    URLS=($(curl -s "https://api.github.com/repos/$REPO/releases/latest" | \
        jq -r '.assets[].browser_download_url'))

    for url in "${URLS[@]}"; do
        filename="${url##*/}"
        curl -L "$url" | bsdtar -xf - -C $GTK3_DEST_DIR
    done
}

echo done