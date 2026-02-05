#!/bin/zsh

PROPERTIES=(
    label="$(LC_ALL=zh_hk date +'%m/%d %a %H:%M')"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
