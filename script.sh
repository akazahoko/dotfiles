#!/bin/zsh

# create symlinks

# .config folder

SOURCE_DIR="$(pwd)/yabai"
CONFIG_DIR="$HOME/.config"

ln -s "$SOURCE_DIR/yabai" "$CONFIG_DIR"
ln -s "$SOURCE_DIR/skhd" "$CONFIG_DIR"
ln -s "$SOURCE_DIR/sketchybar" "$CONFIG_DIR"
