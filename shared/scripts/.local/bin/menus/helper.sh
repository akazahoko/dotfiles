#!/bin/zsh

# VARIABLES

SCRIPT="${0:A:h}/$NAME/funcs.sh"
CONTINUE='read -k 1 -q "?Press any key to continue"'
CHAFA='chafa -f sixels -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}"'
BAT='bat --color=always'
ICON_DIR="${0:A:h:h}/icons"

show_dmenu() {
    # fuzzel
    fuzzel --dmenu \
        --width=22 \
        --nth-delimiter=: \
        --with-nth=3 \
        --accept-nth=2 \
        --hide-prompt \
        --auto-select \
        --match-nth=1
}

print_prompt() {
    for i in {1..${#PROMPTS}}; do
        printf '%d:%b\n' "$i" "${PROMPTS[i]}"
    done
}

prompt_user() {
    OPTION=$(print_prompt | show_dmenu)

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
