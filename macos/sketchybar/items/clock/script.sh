#!/bin/zsh

PROPERTIES=(
    label="$(LC_ALL=zh_hk date +'%b月%-d日(%a) %H:%M')"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
