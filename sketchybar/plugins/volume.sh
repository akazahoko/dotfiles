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
  ICON_PADDING=5
  LABEL_PADDING_L=0
  LABEL_PADDING_R=0
else
  ICON_PADDING=3
  LABEL_PADDING_L=2
  LABEL_PADDING_R=5
fi

CONFIG=(
  label="$VOLUME"
  icon="$ICON"
  icon.padding_right="$ICON_PADDING"
  label.padding_left="$LABEL_PADDING_L"
  label.padding_right="$LABEL_PADDING_R"
)

sketchybar --set "$NAME" "${CONFIG[@]}"
