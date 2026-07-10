#!/bin/zsh

CURR_DIR="${0:A:h}"

ln -sf $CURR_DIR/styles/$1/config.jsonc $CURR_DIR/config.jsonc
ln -sf $CURR_DIR/styles/$1/style.css $CURR_DIR/style.css

pkill waybar
waybar > /dev/null 2>&1 &
disown
