#!/bin/zsh

CURR_DIR="${0:A:h}"

ln -sf $CURR_DIR/configs/$1.jsonc $CURR_DIR/config.jsonc
ln -sf $CURR_DIR/styles/$1.css $CURR_DIR/style.css

pkill waybar
waybar > /dev/null 2>&1 &
disown
