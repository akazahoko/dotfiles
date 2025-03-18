#!/bin/bash

sketchybar --add item sep left	\
	   --set sep icon="|"	\
		     label.drawing=off		\
		     background.drawing=off	\
		     icon.font.style=bold	

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "=")

for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=7
    icon.padding_right=7
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )
  sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done

sketchybar --add bracket spaces front_app sep '/space\..*/'	\
	   --set spaces background.height=35			\
