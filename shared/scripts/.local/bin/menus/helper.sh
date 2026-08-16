#!/bin/zsh

# VARIABLES

source "${0:A:h}/locales/zh.sh"

SCRIPT="${0:A:h}/$NAME/funcs.sh"
CONTINUE='read -k 1 -q "?Press any key to continue"'
CHAFA='chafa -f sixels -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"'
BAT='bat --color=always'
ICON_DIR="${0:A:h:h}/icons"

prompt_user() {
    OPTION=$(echo $(
        printf '%b\n' "${PROMPTS[@]}" |
            fuzzel --dmenu \
                --width=22 \
                --nth-delimiter=: \
                --with-nth=2 \
                --accept-nth=1 \
                --hide-prompt
    ))

    if [[ -z $OPTION ]]; then
        exit 0
    fi
}

spawn_terminal() {
    foot -a menu -T $TITLE $SCRIPT $OPTION
}

spawn_direct() {
    $SCRIPT $OPTION
}

notify_std() {
    notify-send -e \
        -a osd \
        -u low \
        -h string:x-canonical-private-synchronous:osd-"$1" \
        -i "$2" \
        -t 1000 \
        "$3" \
        "$4"
}

# usage: notify_std "id" "icon" "title" "content" ("slider")

notify_slider() {
    notify-send -e \
        -a osd \
        -u low \
        -h string:x-canonical-private-synchronous:osd-"$1" \
        -i "$2" \
        -t 1000 \
        "$3" \
        "$4" \
        -h int:value:"$5"
}
