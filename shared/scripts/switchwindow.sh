#!/bin/zsh

address=$(hyprctl clients -j | jq -r '.[] | "\(.address)\t\(.title)"' | fuzzel -d --width=60 --with-nth=2 --accept-nth=1)

hyprctl dispatch focuswindow "address":"$address"