#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
LOW="$(pmset -g | grep 'lowpowermode')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="􀛨" COLOR=0xffffffff
  ;;
  [6-8][0-9]) ICON="􀺸"	COLOR=0xffffffff
  ;;
  [3-5][0-9]) ICON="􀺶" COLOR=0xffffffff
  ;;
  [1-2][0-9]) ICON="􀛩" COLOR=0xffff0000
  ;;
  *) ICON="􀛪"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋" COLOR=0xff00ca48
fi

if [ "$LOW" = " lowpowermode         1" ]; then
  COLOR=0xffffcc00
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color="$COLOR"
