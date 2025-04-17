#!/bin/sh

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="lain"
fi
