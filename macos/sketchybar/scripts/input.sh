#!/bin/bash

INPUT="$(
    defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | \
    grep -E "KeyboardLayout Name|Input Mode" | awk '{print $4}'
)"

case "$INPUT" in
    *"ABC"*)        IME="A";;
    *"Japanese"*)   IME="あ";;
    *"Cangjie"*)    IME="倉";;
    *)              IME="?";;
esac

PROPERTIES=(
    icon="󰌌"
    label="$IME"
)

sketchybar --set "$NAME" "${PROPERTIES[@]}"
