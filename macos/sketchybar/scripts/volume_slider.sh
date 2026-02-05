#!/bin/bash

if [ "$SENDER" = "volume_change" ]; then
  sketchybar --set "$NAME" slider.percentage="$INFO"
fi

if [ "$SENDER" = "mouse.exited" ]; then
  sleep 1
  sketchybar --set volume popup.drawing=off
fi 

if [ "$SENDER" = "mouse.clicked" ]; then
  osascript -e "set volume output volume "$PERCENTAGE""
fi

