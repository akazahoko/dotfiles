#!/bin/bash

OS="$(uname -s)"
CONFIG_DIR="$(echo $HOME)/.config/"
DOTFILES_DIR="$(pwd)"

LINUX_DOTFILES=(
    "hypr"
    "wlogout"
    "waybar"
    "fuzzel"
)

MAC_DOTFILES=(
    "yabai"
    "skhd"
    "sketchybar"
)

UNI_DOTFILES=(
    "nvim"
    "tmux"
    "fastfetch"
)

if [ "$OS" == "Linux" ]; then
    for i in "${LINUX_DOTFILES[@]}"; do
        ln -s "$DOTFILES_DIR/$i" "$CONFIG_DIR" 
    done
elif [ "$OS" == "Darwin" ]; then
    for i in "${MAC_DOTFILES[@]}"; do
        ln -s "$DOTFILES_DIR/$i" "$CONFIG_DIR" 
    done
fi

for i in "${UNI_DOTFILES[@]}"; do
    ln -s "$DOTFILES_DIR/$i" "$CONFIG_DIR" 
done