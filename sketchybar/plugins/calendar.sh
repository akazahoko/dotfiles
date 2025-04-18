#!/bin/bash

CONFIG=(
  icon.drawing=off
  label.padding_right=10
  label="$(LC_ALL=zh_HK date +'%b月%-d日 %A(%U) %p %-I:%M')"
)

sketchybar --set $NAME "${CONFIG[@]}"
