#!/bin/bash

TITLE=$(komorebic visible-windows | jq -r '.[]? // [] | .[]? | select(.exe == "'$INFO'") | .title')

PROPERTIES=(
    label="$TITLE"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"