#!/bin/sh

KBINPUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -E "KeyboardLayout Name|Input Mode")"

if [[ $KBINPUT == *"ABC"* ]]; then
    IME="A"
elif [[ $KBINPUT == *"Japanese"* ]]; then
    IME="あ"
elif [[ $KBINPUT == *"Cangjie"* ]]; then
    IME="倉"
else
    IME="?"
fi

if [ "$BUTTON" = "left" ]; then
    open "x-apple.systempreferences:com.apple.preference.keyboard"
fi

CONFIG=(
    icon="􀇳"
    label="$IME" 
)

sketchybar --set "$NAME" ${CONFIG[@]}
