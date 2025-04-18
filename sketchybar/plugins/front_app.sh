#!/bin/sh

CONFIG=(
    label="lain"
)

if [ "$SENDER" = "front_app_switched" ]; then
    sketchybar --set "$NAME" "${CONFIG[@]}" 
fi
