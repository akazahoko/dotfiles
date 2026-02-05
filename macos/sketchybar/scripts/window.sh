#!/bin/bash

TITLE=$(yabai -m query --windows --window | jq -r '.title')

PROPERTIES=(
    label="$TITLE"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"