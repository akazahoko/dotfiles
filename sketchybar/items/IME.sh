#!/bin/bash

sketchybar --add item IME right				\
	   --set IME script="$PLUGIN_DIR/IME.sh"	\
		     background.drawing=off		\
		     icon.padding_left=5		\
		     icon.padding_right=2		\
		     label.padding_left=3		\
		     label.padding_right=5		\
	   --subscribe IME IME_change mouse.clicked
