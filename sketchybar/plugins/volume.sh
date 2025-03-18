#!/bin/sh

if [ "$SENDER" = "volume_change" ]; then
  
  VOLUME=$INFO 

  case "$VOLUME" in
    [6-9][0-9]|100)	ICON="󰕾" 
    ;;
    [3-5][0-9])		ICON="󰖀"
    ;;
    [1-9]|[1-2][0-9])	ICON="󰕿"
    ;;
    *) 			ICON="󰖁" VOLUME=""
  esac 

fi

if [ "$VOLUME" = "" ]; then
  ICON_PADDING=5
  L_PL=0
  L_PR=0
else
  ICON_PADDING=3
  L_PL=2
  L_PR=5
fi

sketchybar --set "$NAME" label="$VOLUME"	\
			 icon="$ICON"		\
			 icon.padding_right="$ICON_PADDING"	\
			 label.padding_left="$L_PL"	\
			 label.padding_right="$L_PR"
