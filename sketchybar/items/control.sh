#!/bin/bash

COMPONENT=(
    bracket
    control
    volume
    IME
    battery
    # brew
)

CONFIG=(
	background.height=35
)

SUBSCRIBE=(
)

NAME="${COMPONENT[1]}"

sketchybar  --add       "${COMPONENT[@]}"           \
	        --set       "${NAME}" "${CONFIG[@]}"    \
	        --subscribe "${NAME}" "${SUBSCRIBE[@]}"
