#!/bin/sh

source "$CONFIG_DIR/colors.sh"

sketchybar --set "$NAME" background.color="$ACCENT_COLOR"	\
			 background.drawing="$SELECTED"		\
			 background.height=30
