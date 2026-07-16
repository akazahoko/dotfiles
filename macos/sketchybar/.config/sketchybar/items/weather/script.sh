#!/bin/bash

TEMPERATURE="$(
    curl -s https://data.weather.gov.hk/weatherAPI/opendata/weather.php\?dataType\=rhrread\&lang\=tc | \
    jq '.temperature.data[].value' | \
    awk '{s+=$1} END {print int(s/NR + 0.5)}'
)"

ICON_ID="$(
    curl https://data.weather.gov.hk/weatherAPI/opendata/weather.php\?dataType\=rhrread | \
    jq '.icon[]'
)"

case $ICON_ID in
    50) ICON="" ;;
    51) ICON="" ;;
    52) ICON="" ;;
    53) ICON="" ;;
    54) ICON="" ;; 
    60) ICON="" ;;
    61) ICON="" ;;
    62) ICON="󰖗" ;;
    63) ICON="" ;;
    64) ICON="" ;;
    65) ICON="" ;;
    70) ICON="" ;;
    71) ICON="" ;;
    72) ICON="" ;;
    73) ICON="" ;;
    74) ICON="" ;;
    75) ICON="" ;;
    76) ICON="" ;;
    77) ICON="" ;;
    80) ICON="" ;;
    81) ICON="󰌪" ;;
    82) ICON="" ;;
    83 | 84) ICON="" ;;
    85) ICON="" ;;
    90) ICON="" ;;
    91) ICON="" ;;
    92) ICON="" ;;
    93) ICON="" ;;
esac

PROPERTIES=(
    icon="${ICON}"
    label="${TEMPERATURE}°C"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
