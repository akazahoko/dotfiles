#!/bin/bash

if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO
  case "$VOLUME" in
  [6-9][0-9] | 100)
    ICON="􀊩"
    ;;
  [3-5][0-9])
    ICON="􀊧"
    ;;
  [1-9] | [1-2][0-9])
    ICON="􀊥"
    ;;
  *) ICON="􀊣" VOLUME="" ;;
  esac
fi

if [ "$VOLUME" = "" ]; then
  VOL_COLOR=0xff6e6e6e
  ICON_PADDING=5
  LABEL_PADDING_L=0
  LABEL_PADDING_R=0
else
  VOL_COLOR=0xffffffff
  ICON_PADDING=3
  LABEL_PADDING_L=2
  LABEL_PADDING_R=5
fi

CONFIG=(
  # label="$VOLUME"
  label.drawing=off
  icon="$ICON"
  icon.color="$VOL_COLOR"
  # icon.align=right
  # icon.padding_right="$ICON_PADDING"
  # label.padding_left="$LABEL_PADDING_L"
  # label.padding_right="$LABEL_PADDING_R"
)

sketchybar --set "$NAME" "${CONFIG[@]}"
