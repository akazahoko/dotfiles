#!/bin/zsh

SCRIPT="${${(%):-%x}:A:h:h}/$NAME.sh"

open_in_term() {
    foot -a menu -T $TITLE $SCRIPT $OPTION
}

open_direct() {
    $SCRIPT $OPTION
}

open_prompt() {
    echo $(
        printf '%b\n' "${PROMPTS[@]}" | \
        fuzzel  --dmenu \
        --width=22  \
        --nth-delimiter=:   \
        --with-nth=2    \
        --accept-nth=1  \
        --hide-prompt
    )
}

OPTION=$(open_prompt)
TITLE=$NAME_$OPTION

if [[ -z $OPTION ]]; then
    exit 0
fi