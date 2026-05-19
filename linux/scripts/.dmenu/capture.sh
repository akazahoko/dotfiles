#!/bin/zsh

source "${0:A:h}/.helper.sh"

LIST=(
    "region:\tRegion"
    "window:\tWindow"
    "monitor:\tMonitor"
    "preview:\tPreview"
    "open_dir:\tHyprshot"
)

prompt_opt "${LIST[@]}"

if [[ "$OPTION" == "preview" ]]; then
    open_terminal "$OPTION" "${0:A:h:h}/${0:t}" "$OPTION"
else
    "${0:A:h:h}/${0:t}" $OPTION
fi