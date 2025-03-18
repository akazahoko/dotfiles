#!/bin/bash

sketchybar --add item brew right	\
	   --set brew script="$PLUGIN_DIR/brew.sh"	\
	   --subscribe brew is_unlock mouse.clicked
