#!/bin/bash

CURRENT_WORKSPACE=$(
    rift-cli query workspaces | jq -r '.[] | select(.is_active == true) | .name'
)

TITLE=$(
    rift-cli query workspaces | jq -r --arg name "$CURRENT_WORKSPACE" '
        .[] | 
        select(.name == $name) | 
        .windows[] | 
        select(.is_focused == true) | 
        .title
    '
)

PROPERTIES=(
    label=$TITLE
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"