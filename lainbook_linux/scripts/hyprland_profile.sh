#!/bin/sh

CURRENT=$(basename $(readlink ~/.config/hypr/hyprland/profile.conf) .conf)

if [ "$CURRENT" == "normal" ]; then
    ln -sf ~/.config/hypr/hyprland/minimal.conf ~/.config/hypr/hyprland/profile.conf
elif [ "$CURRENT" == "minimal" ]; then
    ln -sf ~/.config/hypr/hyprland/normal.conf ~/.config/hypr/hyprland/profile.conf
fi