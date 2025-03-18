h#!/bin/bash

sketchybar --add item battery right				\
	   --set battery update_freq=120			\
	   	 	 script="$PLUGIN_DIR/battery.sh"	\
			 click_script="open "x-apple.systempreferences:com.apple.preference.battery""	\
			 background.drawing=off			\
			 icon.padding_left=5	 		\
			 icon.padding_rigft=2	 		\
			 label.padding_left=3			\
			 label.padding_right=0			\
	   --subscribe battery system_woke power_source_change
