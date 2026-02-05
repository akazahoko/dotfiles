#!/bin/zsh

function clipboard() {
    cliphist list | \
    fzf --reverse   \
        --with-nth=2.. \
        --bind 'ctrl-d:execute(echo {} | cliphist delete)+reload(cliphist list)' \
        --bind 'delete:execute(echo {} | cliphist delete)+reload(cliphist list)' \
        --bind 'alt-shift-delete:execute(cliphist wipe)+reload(cliphist list)'  \
        --bind 'alt-r:reload(cliphist list)'   \
        --bind 'enter:execute(cliphist decode {} | wl-copy)+accept'   \
        --bind 'ctrl-c:execute(cliphist decode {} | wl-copy)+accept'   \
        --bind 'ctrl-i:execute(wl-copy {q})+reload(cliphist list)'   \
        --bind 'ctrl-o:execute(echo -e {2..} | vipe | wl-copy)+reload(cliphist list)'   \
        --preview '
            if [[ $(cliphist decode {} | file -b --mime-type -) == image/* ]]; then
                cliphist decode {} | chafa -f sixels -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}
            else
                cliphist decode {} | bat
            fi'
}

function nerdglyphs() {
    GLYPHS_LIST=$(
        curl -s https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json | \
        jq -r 'to_entries[] | select(.key != "METADATA") | "\(.key) \(.value.char)"'
    )

    echo -e "$GLYPHS_LIST" | \
    fzf --preview '
            echo -e {2} | 
            magick -background none -fill white -font "FiraCode-Nerd-Font-Reg" -pointsize 256 label:@- png:- | 
            chafa -f sixels -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}' \
        --bind 'enter:execute(wl-copy {2})'
}

function emojis() {
    EMOJI_LIST=$(
        cat /usr/share/unicode/emoji/emoji-test.txt | \
        grep -E "^[0-9A-F]" | \
        sed 's/^[^#]*#//' | \
        sed 's/ //'
    )

    echo -e "$EMOJI_LIST" | \
    fzf --preview '
            echo -e {1} | 
            magick -background transparent -pointsize 128 -font "apple-color-emoji" pango:@- png:- | 
            chafa -f sixels -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}' \
        --bind 'enter:execute(wl-copy {1})'
}

$1