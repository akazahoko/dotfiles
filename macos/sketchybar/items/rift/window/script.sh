#!/bin/bash

WS_JSON=$(rift-cli query workspaces)

CURRENT_WS_ID=$(
    echo $WS_JSON | \
    jq -r '.[] | select(.is_active == true) | .index'
)

FOCUSED_APP=$(
    echo $WS_JSON | \
    jq -r '.[] | select(.index == '$CURRENT_WS_ID') | .windows[] | select(.is_focused == true)'
)

TITLE=$(echo $FOCUSED_APP | jq -r '.title')

if [[ $TITLE == "" ]]; then
    TITLE=$(echo $FOCUSED_APP | jq -r '.app_name')
fi

PROPERTIES=(
    label=$TITLE
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"