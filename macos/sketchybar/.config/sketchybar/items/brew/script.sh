#!/bin/zsh

FORMULAE="$(
    brew outdated --greedy | \
    grep -v "font-sf-pro" | \
    wc -l | \
    sed 's/^[ \t]*//'
)"

if [ $FORMULAE = "0" ]; then
    LABEL="􀁢"
else
    LABEL=$FORMULAE
fi

PROPERTIES=(
    icon="󰏖"
    icon.padding_left=5
    label="$LABEL"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
