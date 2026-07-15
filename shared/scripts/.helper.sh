#!/bin/zsh

SCRIPT_DIR="${${(%):-%x}:A:h}"

CONTINUE='read -k 1 -q "?Press any key to continue"'
CHAFA='chafa -f sixels -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"'
BAT='bat --color=always'

idk_function() {
    # 1. If $1 is empty, print error to stderr and show valid options
    if [[ -z "$1" ]]; then
        echo "Error: No picker module specified." >&2
        echo "Usage: ${0:t} [clipboard | emojis | glyphs]" >&2
        exit 1
    fi

    # 2. Check if the requested argument matches an actual defined function
    if functions "$1" > /dev/null; then
        "$1" # Dynamically execute the function matching the string in $1
    else
        # echo "Error: Unknown picker option '$1'." >&2
        # echo "Valid modules: clipboard, emojis, glyphs" >&2
        exit 1
    fi
}

open_dmenu() {
    fuzzel  --dmenu \
            --width=20  \
            --nth-delimiter=:   \
            --with-nth=2    \
            --accept-nth=1  \
            --hide-prompt
}

open_terminal() {
    foot -a menu -T $1 $2 $3
}

prompt_opt() {
    OPTION=$(printf '%b\n' "$@" | open_dmenu)
    
    if [[ -z "$OPTION" ]]; then
        exit 0
    fi
}