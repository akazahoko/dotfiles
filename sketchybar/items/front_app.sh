#!/bin/bash

sketchybar 	--add item front_app left 				\
	  		--set front_app       					\
				script="$PLUGIN_DIR/front_app.sh"	\
				label.font.style=Bold				\
				label.padding_left=5				\
				label.padding_right=5				\
				background.drawing=off				\
	   		--subscribe front_app front_app_switched
