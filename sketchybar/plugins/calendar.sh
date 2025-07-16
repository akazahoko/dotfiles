#!/bin/bash

CONFIG=(
  label="$(LC_ALL=zh_HK date +'%B%-d日 週%a %-I:%M')"
  # label="$(LC_ALL=zh_HK date +'%-I:%M')"
)

sketchybar --set $NAME "${CONFIG[@]}"