#!/bin/bash

sketchybar  --add item sep left	      \
	          --set sep icon="|"	      \
		        label.drawing=off		      \
		        background.drawing=off	  \
		        icon.font.style=regular	  \

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "=")

sketchybar  --subscribe space.2 space_window_change

for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  # APP_ICONS=()
  # while read;
  # do 
  #   APP_ICONS+=( "$($PLUGIN_DIR/icon_map_fn.sh $REPLY)")
  # done < <(yabai -m query --windows --space $(($i+1)) | grep "app" | cut -c 9- | cut -d '"' -f 1 | sort -u)

  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=7
    icon.padding_right=7
    label=$INFO
    label.drawing=on
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )
  sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done

sketchybar  --add bracket spaces front_app sep '/space\..*/'	\
            --set spaces background.height=35			            \
            --subscribe spac space_windows_change           \