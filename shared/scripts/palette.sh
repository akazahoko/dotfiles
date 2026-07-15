#!/bin/zsh

source "${0:A:h}/.helper.sh"

clipboard() {
    cliphist list | fzf --reverse --with-nth=2.. \
    --bind 'ctrl-d:execute(echo {} | cliphist delete)+reload(cliphist list)' \
    --bind 'delete:execute(echo {} | cliphist delete)+reload(cliphist list)' \
    --bind 'alt-shift-delete:execute(cliphist wipe)+reload(cliphist list)' \
    --bind 'alt-r:reload(cliphist list)' \
    --bind 'enter:execute(cliphist decode {} | wl-copy)+accept' \
    --bind 'ctrl-c:execute(cliphist decode {} | wl-copy)+accept' \
    --bind 'ctrl-i:execute(wl-copy {q})+reload(cliphist list)' \
    --bind 'ctrl-o:execute(echo -e {2..} | vipe | wl-copy)+reload(cliphist list)' \
    --preview '
        if [[ $(cliphist decode {} | file -b --mime-type -) == image/* ]]; then
            cliphist decode {} | '$CHAFA'
        else
            cliphist decode {} | '$BAT'
        fi'
}

emojis() {
    local EMOJI_FILE="/usr/share/unicode/emoji/emoji-test.txt"
    [[ ! -f "$EMOJI_FILE" ]] && echo "Error: $EMOJI_FILE not found." && return 1

    cat "$EMOJI_FILE" | \
    grep -E "^[0-9A-F]" | \
    sed 's/^[^#]*# //' | \
    fzf --preview '
        echo -n {1} | \
        magick -background none -pointsize 128 -font "Noto Color Emoji" pango:@- png:- | \
        '"$CHAFA" \
    --bind 'enter:execute(echo -n {1} | wl-copy)+accept'
}

nerdglyphs() {
    local FILE="$HOME/.cache/nerdglyphs.json"
    [[ ! -f "$FILE" ]] && curl -s https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json -o $FILE

    cat $FILE | \
    jq -r 'to_entries[] | select(.key != "METADATA") | "\(.key) \(.value.char)"' | \
    fzf --preview '
        echo -e {2} | 
        magick -background none -fill white -font "FiraCode-Nerd-Font-Reg" -pointsize 256 label:@- png:- | 
        '$CHAFA'' \
        --bind 'enter:execute(wl-copy {2})+accept'
}

pipette() {
    hyprpicker -a
}

$1