#!/bin/sh

UNAME="$(uname -s)"
CONFIG_DIR="$(echo $HOME)/.config/"
DOTFILES_DIR="$(echo $HOME)/.dotfiles"

LINUX_DOTFILES=($DOTFILES_DIR/linux/*)
SHARED_DOTFILES=($DOTFILES_DIR/shared/*)

if [ "$UNAME" == "Linux" ]; then
    for i in "${LINUX_DOTFILES[@]}"; do
        ln -sf $i $CONFIG_DIR
    done    
elif [ "$UNAME" == "Darwin" ]; then
    for i in "${MACOS_DOTFILES[@]}"; do
        ln -sf $i $CONFIG_DIR
    done
fi

for i in "${SHARED_DOTFILES[@]}"; do
    ln -sf $i $CONFIG_DIR
done
