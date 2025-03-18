#!/bin/bash

sketchybar --add item calendar right				\
	   --set calendar script="$PLUGIN_DIR/calendar.sh"	\
			  click_script="open -a calendar"	\
			  update_freq=30			\
			  label.padding_left=5			\
			  label.padding_right=5			\
			  icon.drawing=off			\
	   --subscribe calendar is_unlock
