#!/bin/zsh

SCRIPT_DIR="${${(%):-%x}:A:h}"

open_dmenu() {
    fuzzel  --dmenu \
            --width=30  \
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