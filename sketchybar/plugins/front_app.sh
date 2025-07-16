#!/bin/bash

CONFIG=(
  label="$INFO"
)

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" "${CONFIG[@]}"
fi
