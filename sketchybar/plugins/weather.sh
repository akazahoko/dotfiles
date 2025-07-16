#!/bin/bash

TEMP="$(curl https://data.weather.gov.hk/weatherAPI/opendata/weather.php\?dataType\=rhrread\&lang\=tc | jq '.temperature.data[].value' | awk '{s+=$1} END {print int(s/NR + 0.5)}')"
ICON_ID="$(curl https://data.weather.gov.hk/weatherAPI/opendata/weather.php\?dataType\=rhrread | jq '.icon[]')"

case "${ICON_ID}" in
  50)
    ICON="􀆮" ;;
  51 | 52)
    ICON="􀇕" ;;
  53 | 54)
    ICON="􀇗" ;;
  60 | 61)
    ICON="􀇃" ;;
  62)
    ICON="􀇅" ;;
  63)
    ICON="􀇇" ;;
  64)
    ICON="􀇉" ;;
  65)
    ICON="􀇓" ;;
  70)
    ICON="􀋃" ;;
  71 | 72 | 73 | 74 | 75 | 77)
    ICON="􀇁" ;;
  76)
    ICON="􀇛" ;;
  *)
    ICON="􀇕" ;;
esac


CONFIG=(
  icon="${ICON}"
  label="${TEMP}􂧤"
)

POP_CONFIG=(
  # label="$(curl https://data.weather.gov.hk/weatherAPI/opendata/weather.php\?dataType\=flw\&lang\=tc | jq -r '.generalSituation')"
)

sketchybar  --set "$NAME" "${CONFIG[@]}"  \
            --set weather_pop "${POP_CONFIG[@]}"
